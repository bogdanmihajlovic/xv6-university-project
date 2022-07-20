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
    int pid;
    using Body = void (*)(void*);

    bool isFinished() const { return finished; }
    void setFinished(bool finished) { this->finished = finished; }

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
        finished(false),
        timeSlice(DEFAULT_TIME_SLICE){

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
    bool finished;
    uint64 timeSlice;

    static void threadWrapper();

    friend class Riscv;
    static void contextSwitch(Context* oldContext, Context* newContext);
    static void dispatch();
    static int counter;
    static uint64 timeSliceCounter;
};
#endif //OS_PROJEKAT_TCB_HPP
