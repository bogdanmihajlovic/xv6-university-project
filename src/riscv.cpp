//
// Created by marko on 20.4.22..
//

#include "../h/riscv.hpp"
#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"
#include "../h/_sem.hpp"
#include "../h/SleepList.hpp"


using Body = void(*)(void*);

_buffer* Riscv::inputBuffer = nullptr;
_buffer* Riscv::outputBuffer = nullptr;



void Riscv::popSppSpie() {
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void Riscv::init()
{
    inputBuffer = new _buffer(100);
    outputBuffer = new _buffer(100);
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

    uint64 volatile scause;
    scause = r_scause();
    uint64 volatile sepc = r_sepc();
    uint64 sstatus = r_sstatus();
    if(scause == ECALL_SYS || scause == ECALL_USER){

        uint64 ret = 0;
        if(operation== MEM_ALLOC){
            ret = (uint64)MemoryAllocator::getMemory((size_t)a1);
        }else if(operation == MEM_FREE){
            ret = (uint64)MemoryAllocator::freeMemory((void*)a1);
        }else if(operation == THREAD_CREATE){
            ret = TCB::createThread((thread_t*)a1, (Body)a2, (void*)a3, (uint64*)a4);
        }else if(operation == THREAD_EXIT){
            ret = TCB::stopThread();
        }else if(operation == THREAD_DISPATCH){
            TCB::yield();
        }else if(operation == SEM_OPEN){
            ret = _sem::createSemaphore((sem_t*)a1, (unsigned)a2);
        }else if(operation == SEM_CLOSE){
            sem_t id = (sem_t)a1;
            id->close();
        }else if(operation == SEM_WAIT){
            sem_t semaphore = (sem_t)a1;
            semaphore->wait();
        }else if(operation == SEM_SIGNAL){
            sem_t semaphore = (sem_t)a1;
            semaphore->signal();
        }else if(operation == THREAD_YIELD){
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
        }else if(operation == TIME_SLEEP){
            time_t time = (time_t)a1;
            SleepList::put(TCB::running, time);
            TCB::running->setStatus(TCB::SLEEPING);
            TCB::dispatch();
        }else if(operation == GETC){
            ret = (uint64)inputBuffer->kget();
        }else if(operation == PUTC){
            outputBuffer->kput((char)a1);
        }
        w_sstatus(sstatus);
        w_sepc(sepc + 4);
        a0 = ret;
    }else if(scause == TIMER){
        SleepList::releaseThreads();
        TCB::timeSliceCounter++;
        if(TCB::timeSliceCounter >= DEFAULT_TIME_SLICE){
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        }
        mc_sip(SIP_SSIP);
    }else if(scause == HARDWARE){
       int code = plic_claim();
        if (code == CONSOLE_IRQ)
            plic_complete(code);
            //console_handler();
    } else{
        // print(scause)
        // print(sepc)
        // print(stval)
    }

    __asm__ volatile("mv a7, %0" : : "r"(a7));
    __asm__ volatile("mv a6, %0" : : "r"(a6));
    __asm__ volatile("mv a5, %0" : : "r"(a5));
    __asm__ volatile("mv a4, %0" : : "r"(a4));
    __asm__ volatile("mv a3, %0" : : "r"(a3));
    __asm__ volatile("mv a2, %0" : : "r"(a2));
    __asm__ volatile("mv a1, %0" : : "r"(a1));
    __asm__ volatile("mv a0, %0" : : "r"(a0));


}