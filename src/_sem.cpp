//
// Created by bogdan on 19.7.22..
//

#include "../h/_sem.hpp"
#include "../h/MemoryAllocator.hpp"

int _sem::createSemaphore(sem_t *handle, int i) {
    *handle = new _sem(i);
    return 0;
}

int _sem::wait() {
    if(!this->active)
        return -1;

    if(--value < 0)
        block();

    if(!this->active)
        return -1;
    return 0;
}

int _sem::signal() {
    if(!this->active)
        return -1;

    if(++value <= 0)
        unblock();
    return 0;
}

void _sem::block() {
    TCB::running->setStatus(TCB::BLOCKED);
    blocked.addLast(TCB::running);
    TCB::dispatch();
}

void _sem::unblock() {
    TCB* t = blocked.removeFirst();
    t->setStatus(TCB::RUNNING);
    Scheduler::put(t);
}

int _sem::close(){

    if(!this->active)
        return -1;
    TCB* thread;
    for(thread = blocked.removeFirst(); thread;){
        thread->setStatus(TCB::RUNNING);
        Scheduler::put(thread);
        thread = blocked.removeFirst();
    }
    this->active = false;
    return 0;
}


void *_sem::operator new(size_t size) {
    return MemoryAllocator::getMemory(size);
}

void *_sem::operator new[](size_t size) {
    return MemoryAllocator::getMemory(size);
}

void _sem::operator delete(void *addr) {
    MemoryAllocator::freeMemory(addr);
}

void _sem::operator delete[](void *addr) {
    MemoryAllocator::freeMemory(addr);
}






