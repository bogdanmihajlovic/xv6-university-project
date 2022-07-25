//
// Created by bogdan on 25.7.22..
//

#include "../h/syscall_cpp.hpp"

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle,body, arg);
}

Thread::~Thread() {

}

int Thread::start() {
    return 0;
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

Thread::Thread() {

}
