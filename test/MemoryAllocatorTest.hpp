//
// Created by bogdan on 11.7.22..
//

#ifndef OS_PROJEKAT_MEMORYALLOCATORTEST_HPP
#define OS_PROJEKAT_MEMORYALLOCATORTEST_HPP


#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"
#include "../h/print.hpp"

class Test{
public:
    int a;
};





void mallocFree();
void bigMalloc();
void lotOfSmallMallocs();
void stressTesting();





#endif //OS_PROJEKAT_MEMORYALLOCATORTEST_HPP
