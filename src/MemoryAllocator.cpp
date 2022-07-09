//
// Created by bogdan on 10.7.22..
//


#include "../h/MemoryAllocator.hpp"


MemoryAllocator::MemoryAllocator() {
    head = (FreeBlock*)HEAP_START_ADDR;
    head->size = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(FreeBlock);
    head->next = 0;
    head->prev = 0;
    tail = head;
}


MemoryAllocator& MemoryAllocator::instance() {
    static MemoryAllocator allocatorInstance;
    return allocatorInstance;
}


