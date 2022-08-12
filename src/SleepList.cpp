//
// Created by bogdan on 21.7.22..
//

#include "../h/SleepList.hpp"
#include "../test/printing.hpp"

List<SleepList::Sleep> SleepList::sleepingThreads;

void SleepList::put(TCB* thread, time_t sleepTime) {
    if(sleepTime <= 0)
        return;

    SleepList::Sleep* elem = new SleepList::Sleep(thread);
    sleepingThreads.resetCurrent();
    Sleep* p = sleepingThreads.getCurrent();
    int position = 0;
    time_t listTime = 0;
    while(p){
        listTime += p->difference;
        if(sleepTime < listTime)
            break;
        sleepingThreads.moveCurrent();
        p = sleepingThreads.getCurrent();
        position++;
    }

    // add as first
    if(!position){
        elem->difference = sleepTime;
        if(p)
           p->difference = p->difference - sleepTime;
        sleepingThreads.addFirst(elem);
    }else if(!p){ // add as last
        elem->difference = sleepTime - listTime;
        sleepingThreads.addLast(elem);
    }else{ // add before p
        elem->difference = sleepTime - (listTime - p->difference);
        p->difference = listTime - sleepTime;
        sleepingThreads.insertAtPosition(elem, position);
    }
    TCB::running->setStatus(TCB::SLEEPING);
}

int SleepList::decrement() {
    Sleep* p = sleepingThreads.peekFirst();
    if(!p)
        return 0;
    p->difference--;
    return 1;
}

void SleepList::releaseThreads(){
    if(!decrement())
        return;
    Sleep* p = sleepingThreads.peekFirst();
    while(p && p->difference == 0){
        TCB* t = p->thread;
        t->status = TCB::RUNNING;
        sleepingThreads.removeFirst();
        Scheduler::put(t);
        Sleep* old = p;
        p = sleepingThreads.peekFirst();
        MemoryAllocator::freeMemory(old);
    }
}

void *SleepList::operator new(size_t size) {
    return MemoryAllocator::getMemory(size);
}

void *SleepList::operator new[](size_t size) {
    return MemoryAllocator::getMemory(size);
}

void SleepList::operator delete(void *addr) {
    MemoryAllocator::freeMemory(addr);
}

void SleepList::operator delete[](void *addr) {
    MemoryAllocator::freeMemory(addr);
}

void SleepList::emptyList() {
    Sleep* p = sleepingThreads.removeFirst();
    Sleep* old = nullptr;
    while(p){
        old = p;
        p = sleepingThreads.removeFirst();
        TCB* t = old->thread;
        TCB::threads.addLast(t);
        MemoryAllocator::freeMemory(old);
    }

}
