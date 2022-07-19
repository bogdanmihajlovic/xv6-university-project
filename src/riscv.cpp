//
// Created by marko on 20.4.22..
//

#include "../h/riscv.hpp"
#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"
using Body = void(*)(void*);

void Riscv::popSppSpie()
{
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}


void Riscv::supervisorTrapHandler(){

    uint64 a0, a1, a2, a3, a4, a5, a6, a7;

    __asm__ volatile ("mv %0, a7" : "=r" (a7));
    __asm__ volatile ("mv %0, a6" : "=r" (a6));
    __asm__ volatile ("mv %0, a5" : "=r" (a5));
    __asm__ volatile ("mv %0, a4" : "=r" (a4));
    __asm__ volatile ("mv %0, a3" : "=r" (a3));
    __asm__ volatile ("mv %0, a2" : "=r" (a2));
    __asm__ volatile ("mv %0, a1" : "=r" (a1));
    __asm__ volatile ("mv %0, a0" : "=r" (a0));

    uint64 operation = a0;

    uint64 scause;
    scause = Riscv::r_scause();

    if(scause == ECALL_SYS || scause == ECALL_USER){

        uint64 sepc;
        sepc = Riscv::r_sepc();
        sepc += 4;
        Riscv::w_sepc(sepc);

        uint64 ret = 0;

        if(operation== MEM_ALLOC){
            ret = (uint64)MemoryAllocator::getMemory((size_t)a1);

        }else if(operation == MEM_FREE){
            ret = (uint64)MemoryAllocator::freeMemory((void*)a1);
        }else if(operation == THREAD_CREATE){
            ret = TCB::createThread((thread_t)a1, (Body)a2, (void*)a3, (uint64*)a4);
        }else if(operation == THREAD_EXIT){

        }else if(operation == THREAD_DISPATCH){
            TCB::yield();
        }
        a0 = ret;
    }


    __asm__ volatile("mv a7, %0" : : "r"(a7));
    __asm__ volatile("mv a6, %0" : : "r"(a6));
    __asm__ volatile("mv a5, %0" : : "r"(a5));
    __asm__ volatile("mv a4, %0" : : "r"(a4));
    __asm__ volatile("mv a3, %0" : : "r"(a3));
    __asm__ volatile("mv a2, %0" : : "r"(a2));
    __asm__ volatile("mv a1, %0" : : "r"(a1));
    __asm__ volatile("mv a0, %0" : : "r"(a0));


    console_handler();
}