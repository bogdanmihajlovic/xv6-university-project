//
// Created by marko on 20.4.22..
//

#ifndef OS_PROJEKAT_HPP
#define OS_PROJEKAT_HPP

#include "list.hpp"

class TCB;

class Scheduler
{
private:
    static List<TCB> readyCoroutineQueue;

public:
    static TCB *get();

    static void put(TCB *tcb);

};

#endif
