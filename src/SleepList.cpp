//
// Created by bogdan on 21.7.22..
//

#include "../h/SleepList.hpp"
#include "../h/print.hpp"

List<SleepList::Sleep> SleepList::sleepingThreads;

void SleepList::put(TCB* thread, time_t sleepTime) {
    SleepList::Sleep* elem = new SleepList::Sleep(thread); // TODO destruktor
    sleepingThreads.resetCurrent();
    Sleep* p = sleepingThreads.getCurrent();
    //Sleep* prev = nullptr;
    int position = 0;
    time_t listTime = 0;
    while(p){
        listTime += p->difference;
        if(sleepTime < listTime)
            break;
        sleepingThreads.moveCurrent();
        //prev = p;
        p = sleepingThreads.getCurrent();
        position++;
    }

    // add as first
    if(!position){
        elem->difference = sleepTime;
        if(p)
           p->difference = p->difference - sleepTime;
        sleepingThreads.addFirst(elem);
        return;
    }else if(!p){ // add as last
        elem->difference = sleepTime - listTime;
        sleepingThreads.addLast(elem);
    }else{ // add before p
        elem->difference = sleepTime - (listTime - p->difference);
        p->difference = listTime - sleepTime;
        sleepingThreads.insertAtPosition(elem, position);
    }

}

void SleepList::printSleepList() {
    sleepingThreads.resetCurrent();
    Sleep* p = sleepingThreads.getCurrent();
    while(p){
        printInteger(p->difference);
        printString("\n");
        sleepingThreads.moveCurrent();
        p = sleepingThreads.getCurrent();
    }
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
        p = sleepingThreads.peekFirst();
    }
}