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

    void *operator new(size_t );
    void *operator new[](size_t);
    void operator delete(void*);
    void operator delete[](void*);

    struct Sleep{
        time_t difference;
        TCB* thread;
        Sleep(TCB* thread) : thread(thread) {}
    };

    static void put(TCB* thread, time_t);
    static void emptyList();

private:
    static List<Sleep> sleepingThreads;
    static int decrement();
    static void releaseThreads();



    friend class Riscv;
};
#endif //OS_PROJEKAT_SLEEPLIST_HPP
