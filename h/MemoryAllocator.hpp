//
// Created by bogdan on 10.7.22..
//



#ifndef OS_PROJEKAT_MEMORYALLOCATOR_HPP
#define OS_PROJEKAT_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"
#include "../lib/console.h"

class MemoryAllocator{

public:

    struct FreeBlock{
        FreeBlock* next;
        FreeBlock* prev;
        size_t size;
    };


    MemoryAllocator(const MemoryAllocator&) = delete;
    MemoryAllocator(MemoryAllocator&&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(MemoryAllocator&&) = delete;

    static MemoryAllocator& getInstance();
    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }
    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }


private:
    void* IGetMemory(size_t);
    int IFreeMemory(void*);
    FreeBlock *head, *tail;
    MemoryAllocator();
    void tryToMerge(FreeBlock* );

};

#endif
