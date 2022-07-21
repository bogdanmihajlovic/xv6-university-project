//
// Created by bogdan on 21.7.22..
//

#ifndef OS_PROJEKAT_SLEEPLIST_HPP
#define OS_PROJEKAT_SLEEPLIST_HPP

#include "../h/list.hpp"
#include "../h/syscall_c.h"

class SleepList{
public:
    struct Sleep{
        time_t difference;
        //TCB* thread;
        //Sleep(time_t real) : realTime(real) {}
    };

    static void put(Sleep* elem, size_t);
    static void printSleepList();
    static Sleep* peekFirst();
    static Sleep* removeFirst();
    static void decrement();
    static time_t getTime();

private:
    static List<Sleep> sleepingThreads;
};
#endif //OS_PROJEKAT_SLEEPLIST_HPP
