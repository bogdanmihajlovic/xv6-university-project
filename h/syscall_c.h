//
// Created by bogdan on 17.7.22..
//

#ifndef OS_PROJEKAT_SYSCALL_C_H
#define OS_PROJEKAT_SYSCALL_C_H

#include "../lib/hw.h"

enum code {
    MEM_ALLOC  = 0x01,
    MEM_FREE = 0x02,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13,
    ECALL_USER = 0x08,
    ECALL_SYS = 0x09
};

void* mem_alloc(size_t );
int mem_free(void*);

class TCB;
typedef TCB* thread_t;
int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg);
int thread_exit ();
void thread_dispatch ();
#endif //OS_PROJEKAT_SYSCALL_C_H
