//
// Created by bogdan on 27.7.22..
//

#ifndef OS_PROJEKAT_MEMORYALLOCATION_C_API_TEST_H
#define OS_PROJEKAT_MEMORYALLOCATION_C_API_TEST_H




#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"
#include "../test//printing.hpp"

class Test{
        public:
        int a;
};



void mallocFree();
void bigMalloc();
void lotOfSmallMallocs();
void stressTesting();


#endif //OS_PROJEKAT_MEMORYALLOCATION_C_API_TEST_H
