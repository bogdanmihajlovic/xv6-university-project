//
// Created by bogdan on 18.7.22..
//

#include "../h/syscall_c.h"

extern "C" void* mem_alloc(size_t size){

    if(size <= 0)
        return 0;


    __asm__ volatile("mv a1, %[var]" : : [var] "r"(size));
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(MEM_ALLOC));
    __asm__ volatile("ecall");
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));

    return (void*)ret;
}

extern "C" int mem_free(void* addr){

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