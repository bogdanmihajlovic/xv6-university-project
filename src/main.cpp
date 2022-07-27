//
// Created by bogdan on 10.7.22..
//

#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"

extern void stressTesting();
extern void userMain(void*);
sem_t mainSem;

int main(){
    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);



    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);

    Riscv::init();


    thread_t empty;
    thread_create(&empty, nullptr, nullptr);
    TCB::running = empty;

    thread_t out;
    thread_create(&out, TCB::output, nullptr);
    thread_t in;
    thread_create(&in, TCB::input, nullptr);


    stressTesting();
    sem_open(&mainSem, 0);

    thread_t main;
    thread_create(&main, TCB::mainWrapper, mainSem);

    thread_t idleThread;
    thread_create(&idleThread, TCB::idle, nullptr);

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    sem_wait(mainSem);

    return 0;
}