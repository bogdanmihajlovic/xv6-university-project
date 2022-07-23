//
// Created by bogdan on 18.7.22..
//

#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"
#include "../lib/mem.h"
// TODO brisanje steka

void TCB::input(void* arg){
    while(1) {
        Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
        volatile char status = *((char *)CONSOLE_STATUS);
        char c;
        while (status & CONSOLE_RX_STATUS_BIT) {
            c = (*(char *) CONSOLE_RX_DATA);
            Riscv::inputBuffer->put(c);
            status = *((char *) CONSOLE_STATUS);
        }
        dispatch();
    }
}

void TCB::output(void* arg) {

    while(1) {
        Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
        uint64 volatile status = *((char *) CONSOLE_STATUS);
        while (status & CONSOLE_TX_STATUS_BIT) {
            char c = Riscv::outputBuffer->get();
            (*(char *) CONSOLE_TX_DATA) = c;
            status = *((char *) CONSOLE_STATUS);
        }
        dispatch();
    }
}
void TCB::yield() {
    __asm__ volatile("mv a0, %[var]" : : [var] "r"(THREAD_YIELD));
    __asm__ volatile("ecall");
}

void TCB::dispatch(){
    TCB* old = running;
    if(old->getStatus() == RUNNING){
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
    running->setStatus(FINISHED);
    TCB::dispatch();
    return 0;
}
void TCB::idle(void* arg){
    Riscv::popSppSpie();
    while(true){
        TCB::dispatch();
    }
}
void TCB::threadWrapper(){
    Riscv::popSppSpie();
    running->body(running->args);
    running->setStatus(FINISHED);
    TCB::yield();
}

uint64 TCB::timeSliceCounter = 0;
TCB* TCB::running = nullptr;

int TCB::counter = 0;