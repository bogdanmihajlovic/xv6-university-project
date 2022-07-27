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


void* MemoryAllocator::IGetMemory(size_t size)  {
    FreeBlock* blk = head;

    // round size to MEM_BLOCK_SIZE
    size_t temp = size / MEM_BLOCK_SIZE;
    size = (temp * MEM_BLOCK_SIZE == size) ? size : (temp + 1)*MEM_BLOCK_SIZE;

    // Try to find free block
    for (; blk != nullptr; blk = blk->next)
        if (blk->size >= size) break;

    // If not found
    if (blk == nullptr) {
        return 0;
    }

    size_t remainingSize = blk->size - size;

    if (remainingSize >= sizeof(FreeBlock) + MEM_BLOCK_SIZE) { // Shrink block and make a new one
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
    } else { // Allocate entire block
        if (blk->prev) {
            blk->prev->next = blk->next;
            if(blk->next) blk->next->prev = blk->prev;
        }
        else {
            head = blk->next;
            head->prev = 0;
        }
    }
    blk->next = 0;
    blk->prev = 0;
    return (char*)blk + sizeof(FreeBlock);
}


int MemoryAllocator::IFreeMemory(void* addr) {

    // Check address
    if( addr == 0 || (char*)addr < HEAP_START_ADDR || (char*)addr > HEAP_END_ADDR){
        return -1;
    }

    // Find where to put new block
    FreeBlock* blk;
    if ( !head || (char*)addr < (char*)head)
        blk = 0;
    else
        for ( blk = head; blk->next != 0 && (char*)addr > (char*)(blk->next); blk = blk->next);

    // Insert the new block after cur:
    FreeBlock* newBlk = (FreeBlock*)((char*)addr - sizeof(FreeBlock));
    newBlk->prev = blk;
    if (blk) newBlk->next = blk->next;
    else newBlk->next = head;
    if (newBlk->next) newBlk->next->prev = newBlk;
    if (blk) blk->next = newBlk;
    else head = newBlk;

    // tryToMerge with next block
    tryToMerge(newBlk);
    tryToMerge(blk);

    return 0;
}

void MemoryAllocator::tryToMerge(FreeBlock* blk)  {
    if (!blk)
        return ;

    if (blk->next && (char*)blk + blk->size == (char*)(blk->next)) {
        blk->size += blk->next->size;
        blk->size += sizeof(FreeBlock);
        blk->next = blk->next->next;
        if (blk->next) blk->next->prev = blk;
    }
}