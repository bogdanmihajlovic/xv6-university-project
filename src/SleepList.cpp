//
// Created by bogdan on 21.7.22..
//

#include "../h/SleepList.hpp"
#include "../h/print.hpp"

List<SleepList::Sleep> SleepList::sleepingThreads;

void SleepList::put(SleepList::Sleep* elem) {
    sleepingThreads.resetCurrent();
    Sleep* p = sleepingThreads.getCurrent();
    Sleep* prev = nullptr;
    int position = 0;
    while(p){
        if(elem->realTime < p->realTime)
            break;
        sleepingThreads.moveCurrent();
        prev = p;
        p = sleepingThreads.getCurrent();
        position++;
    }

    // add as first
    if(!position){
        elem->difference = elem->realTime;
        if(p)
           p->difference = p->realTime - elem->realTime;
        sleepingThreads.addFirst(elem);
        return;
    }else if(!p){ // add as last
        Sleep* oldLast = sleepingThreads.peekLast();
        elem->difference = elem->realTime - oldLast->realTime;
        sleepingThreads.addLast(elem);
    }else{ // add before p
        elem->difference = elem->realTime - prev->realTime;
        p->difference = p->realTime - elem->realTime;
        sleepingThreads.insertAtPosition(elem, position);
    }

}

void SleepList::printSleepList() {
    sleepingThreads.resetCurrent();
    Sleep* p = sleepingThreads.getCurrent();
    while(p){
        printInteger(p->realTime);
        printString(", ");
        printInteger(p->difference);
        printString("\n");
        sleepingThreads.moveCurrent();
        p = sleepingThreads.getCurrent();
    }
}
