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


MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    return instance;
}


void* MemoryAllocator::getMemory(size_t size)  {

    FreeBlock* blk = head;

    size_t temp = size / MEM_BLOCK_SIZE;
    size = (temp * MEM_BLOCK_SIZE == size) ? size : (temp + 1)*MEM_BLOCK_SIZE;

    // Try to find free block
    for (; blk != nullptr; blk = blk->next)
        if (blk->size >= size) break;

    // If not found
    if (blk == nullptr) {
        return 0;
    }

    // Allocate the requested block:
    size_t remainingSize = blk->size - size;

    if (remainingSize >= sizeof(FreeBlock) + MEM_BLOCK_SIZE) {
        // A fragment remains
        blk->size = size;
        size_t offset = sizeof(FreeBlock) + size;
        FreeBlock* newBlk = (FreeBlock*)((char*)blk + offset);
        if (blk->prev) {
            blk->prev->next = newBlk;
            newBlk->prev = blk->prev;
        }
        else {
            head = newBlk;
            head->prev = 0;
        }
        newBlk->next = blk->next;
        newBlk->size = remainingSize - sizeof(FreeBlock);
    } else {
        // No remaining fragment, allocate the entire block
        if (blk->prev) blk->prev->next = blk->next;
        else head = blk->next;
    }
    blk->next = 0;
    blk->prev = 0;
    return (char*)blk + sizeof(FreeBlock);
}



int MemoryAllocator::freeMemory(void* address) {
    // TO DO
    return 0;
}

