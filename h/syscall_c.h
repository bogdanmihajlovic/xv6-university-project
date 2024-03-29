//
// Created by bogdan on 17.7.22..
//

#ifndef OS_PROJEKAT_SYSCALL_C_H
#define OS_PROJEKAT_SYSCALL_C_H

#include "../lib/hw.h"

enum code {
    BUDDY_ALLOC = 0x25,
    BUDDY_FREE = 0x26,
    MEM_ALLOC  = 0x01,
    MEM_FREE = 0x02,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13,
    THREAD_YIELD = 0x14,
    SEM_OPEN = 0x21,
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24,
    TIME_SLEEP = 0x31,
    ECALL_USER = 0x08,
    ECALL_SYS = 0x09,
    CONSOLE = 0x0a,
    GETC = 0x41,
    PUTC = 0x42,
    THREAD_CPP_CREATE = 0x15,
    TIMER = 0x8000000000000001UL, // supervisor software interrupt
    HARDWARE = 0x8000000000000009UL
};

void* buddy_alloc(size_t);
void buddy_free(void* obj, size_t size);
void* mem_alloc(size_t );
int mem_free(void*);

class TCB;
typedef TCB* thread_t;
int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg);
int thread_exit ();
void thread_dispatch ();

class _sem;
typedef _sem* sem_t;
int sem_open(sem_t* handle, unsigned init);
int sem_close(sem_t handle);
int sem_wait (sem_t id);
int sem_signal (sem_t id);

typedef unsigned long time_t;
int time_sleep (time_t);

const int EOF = -1;
char getc ();
void putc(char);

int thread_cpp_create(thread_t* handle, void(*start_routine)(void*), void* arg);

#endif //OS_PROJEKAT_SYSCALL_C_H
