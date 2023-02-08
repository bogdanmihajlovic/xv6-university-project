//
// Created by marko on 20.4.22..
//

#include "../h/scheduler.hpp"
#include "../h/TCB.hpp"

List<TCB> Scheduler::readyCoroutineQueue;


TCB *Scheduler::get(){
    return readyCoroutineQueue.removeFirst();
}

void Scheduler::put(TCB *ccb){
    if(ccb == nullptr)
        return;
    readyCoroutineQueue.addLast(ccb);
}

