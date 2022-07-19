//
// Created by bogdan on 18.7.22..
//

#include "../h/syscall_c.h"

void* mem_alloc(size_t size){

    if(size <= 0)
        return 0;
    size_t temp = size / MEM_BLOCK_SIZE;
    size_t sz = (temp * MEM_BLOCK_SIZE == size) ? size : (temp + 1)*MEM_BLOCK_SIZE;

    __asm__ volatile("mv a1, %[var]" : : [var] "r"(sz));
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(MEM_ALLOC));
    __asm__ volatile("ecall");
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));

    return (void*)ret;
}

int mem_free(void* addr){

    if(!addr)
        return 0;

    uint64 param = (uint64)(addr);
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(param));
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(MEM_FREE));
    __asm__ volatile("ecall");
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));

    return (int)ret;
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){

    void* stack = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);

    __asm__ volatile("mv a4, %[var]" : : [var] "r"(stack));
    __asm__ volatile("mv a3, %[var]" : : [var] "r"(arg));
    __asm__ volatile("mv a2, %[var]" : : [var] "r"(start_routine));
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(handle));
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_CREATE));
    __asm__ volatile("ecall");

    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));
    return (int)ret;

}
int thread_exit (){
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_EXIT));
    __asm__ volatile("ecall");
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));

    return (int)ret;
}
void thread_dispatch (){
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_DISPATCH));
    __asm__ volatile("ecall");
}