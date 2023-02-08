//
// Created by bogdan on 10.7.22..
//



#ifndef OS_PROJEKAT_MEMORYALLOCATOR_HPP
#define OS_PROJEKAT_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"
#include "../lib/console.h"

class MemoryAllocator{
public:

    MemoryAllocator(const MemoryAllocator&) = delete;
    MemoryAllocator(MemoryAllocator&&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(MemoryAllocator&&) = delete;


    static void* getMemory(size_t size) { return getInstance().IGetMemory(size); }

    static int freeMemory(void* addr) { return getInstance().IFreeMemory(addr); }

private:

    struct FreeBlock{
        FreeBlock* next;
        FreeBlock* prev;
        size_t size;
    };

    static MemoryAllocator& getInstance();
    void* IGetMemory(size_t);
    int IFreeMemory(void*);
    FreeBlock *head, *tail;
    MemoryAllocator();
    void tryToMerge(FreeBlock* );

    const void* START_ADDR;
    const void* END_ADDR;
};

#endif
