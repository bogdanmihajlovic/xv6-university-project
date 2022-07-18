//
// Created by bogdan on 17.7.22..
//

#ifndef OS_PROJEKAT_SUPERVISORTRAPHANDLER_HPP
#define OS_PROJEKAT_SUPERVISORTRAPHANDLER_HPP

#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/MemoryAllocator.hpp"

extern "C" void supervisorTrapHandler();

#endif //OS_PROJEKAT_SUPERVISORTRAPHANDLER_HPP
