//
// Created by bogdan on 10.7.22..
//

#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/SleepList.hpp"




int main(){

    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);

    Riscv::init();

    thread_t empty;
    thread_create(&empty, nullptr, nullptr);
    TCB::running = empty;

    thread_t out;
    thread_create(&out, TCB::output, nullptr);

    thread_t in;
    thread_create(&in, TCB::input, nullptr);

    sem_t mainSem;
    sem_open(&mainSem, 0);


    thread_t main;
    thread_create(&main, TCB::mainWrapper, mainSem);

    thread_t idleThread;
    thread_create(&idleThread, TCB::idle, nullptr);

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    sem_wait(mainSem);


    while(Riscv::outputBuffer->getCnt() > 0)
        thread_dispatch();

    SleepList::emptyList();
    TCB::deleteThreads(); // delete threads
    Riscv::finish(); //delete inputBuffer and outputBuffer

    delete out;
    delete in;
    delete idleThread; // in out and idleThread are while(true)
    delete mainSem;

    return 0;
}