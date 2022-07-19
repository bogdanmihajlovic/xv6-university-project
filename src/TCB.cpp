//
// Created by bogdan on 18.7.22..
//

#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"

void TCB::yield() {
    Riscv::pushRegisters();
    TCB::dispatch();
    Riscv::popRegisters();
}

void TCB::dispatch(){
    TCB* old = running;
    if(!old->isFinished()){
        Scheduler::put(old);

    }
    running = Scheduler::get();
    TCB::contextSwitch(&old->context, &running->context);
}


int TCB::createThread(thread_t* handle, Body body, void* args, uint64* stack) {
    TCB* thread  = new TCB(body, args, stack);
    *handle = thread;
    return 0; // TODO obrada greske
}

int TCB::stopThread() {
    running->setFinished(true);
    yield();
    return 0; // TODO obrada greske
}

TCB* TCB::running = nullptr;
int TCB::counter = 0;