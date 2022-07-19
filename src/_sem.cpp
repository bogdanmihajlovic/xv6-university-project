//
// Created by bogdan on 19.7.22..
//

#include "../h/_sem.hpp"

int _sem::createSemaphore(sem_t *handle, unsigned int i) {
    *handle = new _sem(i);
    return 0;
}

void _sem::wait() {
    // TODO lock()
    if(--value < 0)
        block();
    // TODO unlock()
}

void _sem::signal() {
    // TODO lock()
    if(++value <= 0)
        unblock();
    // TODO unlock()
}

void _sem::block() {
    blocked.addLast(TCB::running);
    // TODO sredi TCB klasu
}

void _sem::unblock() {
    TCB* t = blocked.removeFirst();
    Scheduler::put(t);
}


