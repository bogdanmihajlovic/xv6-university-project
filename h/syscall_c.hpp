//
// Created by bogdan on 17.7.22..
//

#ifndef OS_PROJEKAT_SYSCALL_C_HPP
#define OS_PROJEKAT_SYSCALL_C_HPP

#include "../lib/hw.h"

enum code {MEM_ALLOC = 0x01};

extern "C" void* mem_alloc(size_t );
extern "C" int mem_free(void*);

#endif //OS_PROJEKAT_SYSCALL_C_HPP
