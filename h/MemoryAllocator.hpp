//
// Created by bogdan on 10.7.22..
//



#ifndef _memoryAllocator_hpp
#define _memoryAllocator_hpp

#include "../lib/hw.h"

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
    void* getMemory(size_t);
    int freeMemory(void*);

private:
    FreeBlock *head, *tail;
    MemoryAllocator();
    void tryToMerge(FreeBlock* );

};

#endif
