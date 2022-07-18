//
// Created by bogdan on 17.7.22..
//

#ifndef OS_PROJEKAT_SYSCALL_C_HPP
#define OS_PROJEKAT_SYSCALL_C_HPP

#include "../lib/hw.h"

enum code {
    MEM_ALLOC  = 0x01,
    MEM_FREE = 0x02,
    ECALL_USER = 0x08,
    ECALL_SYS = 0x09
};

extern "C" void* mem_alloc(size_t );
extern "C" int mem_free(void*);

#endif //OS_PROJEKAT_SYSCALL_C_HPP
