//
// Created by bogdan on 21.7.22..
//

#include "../h/SleepList.hpp"
#include "../h/print.hpp"

List<SleepList::Sleep> SleepList::sleepingThreads;

void SleepList::put(SleepList::Sleep* elem, size_t sleepTime) {

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

void SleepList::decrement() {
    Sleep* p = sleepingThreads.peekFirst();
    p->difference--;
}

time_t SleepList::getTime() {
    Sleep* p = sleepingThreads.peekFirst();
    if(p)
        return p->difference;
    else
        return -1;

}