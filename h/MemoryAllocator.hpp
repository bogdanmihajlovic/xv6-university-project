//
// Created by bogdan on 10.7.22..
//



#ifndef _memoryAllocator_hpp
#define _memoryAllocator_hpp

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

    static MemoryAllocator& instance();
    void* memoryMalloc(size_t);

private:
    FreeBlock *head, *tail;
    MemoryAllocator();

};

#endif
