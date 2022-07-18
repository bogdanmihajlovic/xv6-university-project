//
// Created by bogdan on 18.7.22..
//

#include "../h/syscall_c.hpp"

extern "C" void* mem_alloc(size_t size){

    if(size <= 0)
        return 0;

    __asm__ volatile("mv a0, %0" : : "r"(MEM_ALLOC)); // reg a0 = 0x01
    __asm__ volatile("mv a1, %0" : : "r" (size)); // reg a1 = size
    __asm__ volatile("ecall");
    void* ret;
    __asm__ volatile ("mv %0, a0" : "=r" (ret));

    return ret;


}