#include "../h/syscall_cpp.hpp"
#include "../h/TCB.hpp"
#include "../lib/mem.h"
#include "../h/SlabAllocator.hpp"


void *operator new(size_t size){
    return mem_alloc(size);
}

void operator delete(void* addres){
    mem_free(addres);
}


struct Params{
    PeriodicThread* thread;
    time_t period;
    Params(PeriodicThread* t, time_t p) : thread(t), period(p) {}
};
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicThreadWrapper, (void*)new Params(this, period)) {
}


Thread::Thread(void (*body)(void *), void *arg) {
    //uint64* stack = (uint64*)mem_alloc(sizeof(uint64)*DEFAULT_STACK_SIZE);
    //TCB::createThread(&myHandle,body, arg, stack, TCB::READY);
    thread_cpp_create(&myHandle, body, arg);
}

Thread::~Thread() {}

int Thread::start() {
    if(myHandle == nullptr)
        return -1;
    if(TCB::createStack(myHandle) == -1)
        return -1;
    TCB::start(myHandle);
    return 0;
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

Thread::Thread() {
/*    uint64* stack = (uint64*)mem_alloc(sizeof(uint64)*DEFAULT_STACK_SIZE);
    TCB::createThread(&myHandle, threadWrapper, (void*)this, stack, TCB::READY);*/
    thread_cpp_create(&myHandle, threadWrapper, (void*)this);
}


void Thread::threadWrapper(void *arg){
    Thread* t = (Thread*)arg;
    if(t == nullptr)
        return;
    t->run();
}

void PeriodicThread::periodicThreadWrapper(void* arg){
    Params* p = (Params*) arg;
    time_t t = p->period;
    while(true){
        p->thread->periodicActivation();
        time_sleep(t);
    }
}



char Console::getc() {  // TODO pcb semafor buffer za konzolu sve liste
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {

}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}
