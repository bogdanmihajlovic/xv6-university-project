//
// Created by bogdan on 1.2.23..
//

#ifndef OS_PROJEKAT_BUDDYALLOCATOR_HPP
#define OS_PROJEKAT_BUDDYALLOCATOR_HPP

#include "../lib/hw.h"
#include "../test/printing.hpp"

class BuddyAllocator{
private:
    enum Alloc {FREE, ALLOC};

    const static int END_SIZE;
    const static int START_SIZE;
    const static int BUCKET_SIZE;

    Alloc bucket[18][1<<13];
    uint64 numOfBlocks[18];
    const void* START_ADDR;

public:
    BuddyAllocator(const BuddyAllocator&) = delete;
    BuddyAllocator(BuddyAllocator&&) = delete;
    BuddyAllocator& operator=(const BuddyAllocator&) = delete;
    BuddyAllocator& operator=(BuddyAllocator&&) = delete;

    int countFree() const;
    void* alloc (size_t size);
    void dealloc(void* addr, size_t size);
    static BuddyAllocator& getInstance();
    static uint64 roundToPow2(uint64 x);
private:

    int getFreeBlock (size_t size) const;
    void* getBlockAddr(size_t size, int block) const;
    int getBlockAddr(size_t size, void* addr) const;
    void setBlock (size_t size, int block, Alloc a) { bucket[size][block] = a; }
    BuddyAllocator();



};

#endif //OS_PROJEKAT_BUDDYALLOCATOR_HPP
