//
// Created by bogdan on 18.7.22..
//

#ifndef OS_PROJEKAT_TCB_HPP
#define OS_PROJEKAT_TCB_HPP


#include "../lib/hw.h"
#include "../h/scheduler.hpp"
#include "../h/syscall_c.h"
#include "../test/printing.hpp"


class TCB {
public:

    enum threadStatus {FINISHED, RUNNING, BLOCKED, SLEEPING, READY};

    using Body = void (*)(void*);


    static TCB* running;
    int pid;

    void setStatus(threadStatus status) { this->status = status; }

    threadStatus getStatus() const { return status; }

    // function for creating thread C API
    static int createThread(thread_t* handle, Body body, void* args, uint64* st);

    // function for creating thread CPP API
    static int createThread(thread_t* handle, Body body, void* args, uint64* st, threadStatus status);

    // stop thread
    static int stopThread();

    // call ecall and in ecall call dispatch
    static void yield();

    // temp function for userMain
    static void mainWrapper(void*);

    // function for printing on console
    static void output(void*);

    // function to get char from console
    static void input(void*);

    // function for idle thread - for switching context
    static void idle(void*);

    // function for starting thread - CPP API
    static int start(thread_t);

    // delete all threads
    static void deleteThreads();

    // function for dynamic stack allocation for CPP API
    static int createStack(thread_t);

    void *operator new(size_t);
    void *operator new[](size_t);
    void operator delete(void*);
    void operator delete[](void*);

    ~TCB(){
        //mem_free(stack);
        if(stack) SlabAllocator::getInstance().deallocKernel(stack, SlabAllocator::STACK);
        stack = nullptr;
    };



private:

    // constructor for C API
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

    // constructor for CPP API
    TCB(Body body, void* args, uint64* stack, threadStatus status) :
    body(body),
    args(args),
    stack(stack),
    context({(uint64)&threadWrapper, stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0}),
    timeSlice(DEFAULT_TIME_SLICE),
    status(status){
        pid = ++counter;
        if (body != nullptr && this->status == RUNNING) {
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


    static void contextSwitch(Context* oldContext, Context* newContext);
    static void dispatch();
    static int counter;
    static uint64 timeSliceCounter;

    friend class Riscv;
    friend class SleepList;
    friend class _sem;


    static List<TCB> threads;

};
#endif //OS_PROJEKAT_TCB_HPP
