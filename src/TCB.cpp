//
// Created by bogdan on 18.7.22..
//

#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
//#include "../h/scheduler.hpp"
//#include "../lib/mem.h"
//#include "../h/MemoryAllocator.hpp"
#include "../h/SlabAllocator.hpp"

extern void userMain();


uint64 TCB::timeSliceCounter = 0;
TCB* TCB::running = nullptr;
int TCB::counter = 0;
List<TCB> TCB::threads;

void TCB::input(void* arg){
    while(1) {
        Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
        char status = *((char *)CONSOLE_STATUS);
        char c;
        while (status & CONSOLE_RX_STATUS_BIT) {
            c = (*(char*) CONSOLE_RX_DATA);
            Riscv::inputBuffer->put(c);
            status = *((char*)CONSOLE_STATUS);
        }
        dispatch();
    }
}


void TCB::output(void* arg) {
    while(1) {
        Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
        char status = *((char *) CONSOLE_STATUS);
        char c;
        while (status & CONSOLE_TX_STATUS_BIT) {
            c = Riscv::outputBuffer->get();
            (*(char*) CONSOLE_TX_DATA) = c;
            status = *((char*)CONSOLE_STATUS);
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
    if(old->getStatus() == RUNNING) {
        Scheduler::put(old);
    }
    while((running = Scheduler::get()) == nullptr){ // If some nullptr in scheduler
        running = Scheduler::get();
    }

    TCB::contextSwitch(&old->context, &running->context);
}

int TCB::createThread(thread_t* handle, Body body, void* args, uint64* stack) {
    TCB* thread  = new TCB(body, args, stack);

    if(thread == nullptr){
        *handle = nullptr;
        return -1;
    }
    *handle = thread;

    return 0;
}

int TCB::createThread(thread_t* handle, Body body, void* args, uint64* stack, threadStatus status) {
    TCB* thread  = new TCB(body, args, stack, status);
    if(thread == nullptr){
        *handle = nullptr;
        return -1;
    }
    *handle = thread;


    return 0;
}

int TCB::stopThread() {
    running->setStatus(FINISHED);
    threads.addLast(running);
    TCB::dispatch();
    return 0;
}
void TCB::idle(void* arg){
     while(true){
        thread_dispatch();
     }
}
void TCB::threadWrapper(){
    Riscv::popSppSpie();
    running->body(running->args);
    running->setStatus(FINISHED);
    threads.addLast(running);
    TCB::yield();
}

int TCB::start(thread_t pid){
    if(pid == nullptr)
        return -1;
    if(pid->stack == nullptr)
        return -1;
    pid->setStatus(RUNNING);
    Scheduler::put(pid);
    return 1;
}

void TCB::mainWrapper(void* sem) {
    userMain();
    sem_signal((sem_t)sem);
}

int TCB::createStack(thread_t pid) {
    if(pid == nullptr){
        return -1;
    }
    pid->stack =  (uint64*)SlabAllocator::getInstance().allocKernel(DEFAULT_STACK_SIZE, SlabAllocator::STACK);
    pid->context.ra  = pid->stack != nullptr ? (uint64)&pid->stack[DEFAULT_STACK_SIZE] : 0;
    if(pid->stack == nullptr)
        return -1;
    return 0;
}



void* TCB::operator new(size_t size) {
    //return MemoryAllocator::getMemory(size);
    return SlabAllocator::getInstance().allocKernel(size, SlabAllocator::TCB);
}

void* TCB::operator new[](size_t size) {
    return MemoryAllocator::getMemory(size);
}

void TCB::operator delete(void* addr) {
    //MemoryAllocator::freeMemory(addr);
    SlabAllocator::getInstance().deallocKernel(addr, SlabAllocator::TCB);
}

void TCB::operator delete[](void* addr) {
    MemoryAllocator::freeMemory(addr);
}

void TCB::deleteThreads() {
    TCB* t = threads.removeFirst();
    while(t){
        TCB* old = t;
        t = threads.removeFirst();
        delete old;
    }
}




