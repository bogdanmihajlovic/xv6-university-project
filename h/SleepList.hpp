//
// Created by bogdan on 21.7.22..
//

#ifndef OS_PROJEKAT_SLEEPLIST_HPP
#define OS_PROJEKAT_SLEEPLIST_HPP

#include "../h/list.hpp"
#include "../h/syscall_c.h"
#include "../h/TCB.hpp"
#include "../h/scheduler.hpp"

class SleepList{
public:
    struct Sleep{
        time_t difference;
        TCB* thread;
        Sleep(TCB* thread) : thread(thread) {}
    };

    static void put(TCB* thread, time_t);

private:
    static List<Sleep> sleepingThreads;
    static int decrement();
    static void releaseThreads();

    friend class Riscv;
};
#endif //OS_PROJEKAT_SLEEPLIST_HPP
