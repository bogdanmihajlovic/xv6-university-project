//
// Created by bogdan on 18.7.22..
//

#ifndef OS_PROJEKAT_TCB_HPP
#define OS_PROJEKAT_TCB_HPP


#include "../lib/hw.h"
#include "../h/scheduler.hpp"
#include "../h/syscall_c.h"
#include "../h/print.hpp"

class TCB {
public:
    enum threadStatus {FINISHED, RUNNING, BLOCKED, SLEEPING};
    int pid;
    using Body = void (*)(void*);

    void setStatus(threadStatus status) { this->status = status; }
    threadStatus getStatus() const { return status; }

    static int createThread(thread_t* handle, Body body, void* args, uint64* st);
    static int stopThread();
    static void yield();


    static TCB* running;

    ~TCB(){
        delete[] stack;
        stack = 0;
    };
private:

    TCB(Body body, void* args, uint64* stack) :
        body(body),
        args(args),
        stack(stack),
        context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
        timeSlice(DEFAULT_TIME_SLICE),
        status(RUNNING){

          pid = ++counter;
          if (body != nullptr) {
              Scheduler::put(this);
          }

    }

    struct Context{
        uint64 sp;
        uint64 ra;
    };

    Body body;
    void* args;
    uint64* stack;
    Context context;
    uint64 timeSlice;
    enum threadStatus status;

    static void threadWrapper();

    friend class Riscv;
    static void contextSwitch(Context* oldContext, Context* newContext);
    static void dispatch();
    static int counter;
    static uint64 timeSliceCounter;
    friend class SleepList;
    friend class _sem;
};
#endif //OS_PROJEKAT_TCB_HPP
