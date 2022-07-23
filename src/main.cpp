//
// Created by bogdan on 10.7.22..
//

#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"
#include "../lib/console.h"
#include "../test/ThreadSleep_C_API_test.hpp"

extern void userMain(void*);
//extern int thread_create(thread_t*,void (*)(void*), void*);

int main(){


    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);

  //  Riscv::init();
    thread_t empty;
   // thread_t main;
   // thread_t idleThread;

    thread_create(&empty, nullptr, nullptr);
    TCB::running = empty;
    //thread_create(&main, userMain, nullptr);
    //printString("main()\n");
   // thread_t out;
   // thread_t in;
   // thread_create(&out, TCB::output,nullptr);
   // thread_create(&in, TCB::input, nullptr);
    //thread_create(&idleThread, TCB::idle, nullptr);

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);


   /* while(main->getStatus() != TCB::FINISHED){
        TCB::yield();
    }*/
    testSleeping();

    return 0;
}