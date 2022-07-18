//
// Created by bogdan on 18.7.22..
//

#include "../h/syscall_c.hpp"

extern "C" void* mem_alloc(size_t size){

    if(size <= 0)
        return 0;

     // reg a0 = 0x01
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(size)); // reg a1 = size
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(MEM_ALLOC));
    __asm__ volatile("ecall");
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));

    return (void*)ret;


}

extern "C" int mem_free(void* addr){

    if(!addr)
        return 0;

    // reg a0 = 0x01
    uint64 param = (uint64)(addr);
    __asm__ volatile("mv a1, %[var]" : : [var] "r"(param)); // reg a1 = size
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(0x02));
    __asm__ volatile("ecall");
    uint64 volatile ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));

    return (int)ret;


}