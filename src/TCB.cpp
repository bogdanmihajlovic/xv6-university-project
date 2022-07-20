//
// Created by bogdan on 18.7.22..
//

#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"
// TODO brisanje steka


void TCB::yield() {
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_NEW));
    __asm__ volatile("ecall");
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
    TCB::yield();
    return 0; // TODO obrada greske
}

void TCB::threadWrapper(){
    Riscv::popSppSpie();
    running->body(running->args);
    running->setFinished(true);
    TCB::yield();
}

uint64 TCB::timeSliceCounter = 0;
TCB* TCB::running = nullptr;
int TCB::counter = 0;