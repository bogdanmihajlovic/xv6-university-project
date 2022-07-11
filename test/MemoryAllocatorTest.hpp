//
// Created by bogdan on 11.7.22..
//

#ifndef OS_PROJEKAT_MEMORYALLOCATORTEST_HPP
#define OS_PROJEKAT_MEMORYALLOCATORTEST_HPP

#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"

class Test{
public:
    int a;
};

void printString(const char *);
void readString(char []);
void printInt(uint64 );
void mallocFree(MemoryAllocator& allocator);
void bigMalloc(MemoryAllocator& allocator);
void lotOfSmallMallocs(MemoryAllocator& allocator);
void stressTesting(MemoryAllocator& allocator);





#endif //OS_PROJEKAT_MEMORYALLOCATORTEST_HPP
