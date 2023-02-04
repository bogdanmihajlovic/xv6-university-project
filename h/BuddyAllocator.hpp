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
    int numOfBlocks[18];
    const void* START_ADDR;

public:
    BuddyAllocator(const BuddyAllocator&) = delete;
    BuddyAllocator(BuddyAllocator&&) = delete;
    BuddyAllocator& operator=(const BuddyAllocator&) = delete;
    BuddyAllocator& operator=(BuddyAllocator&&) = delete;

    int countFree() const;
    void* alloc (int size);
    void dealloc(void* addr, int size);
    static BuddyAllocator& getInstance();

private:

    int getFreeBlock (int size) const;
    void* getBlockAddr(int size, int block) const;
    int getBlockAddr(int size, void* addr) const;
    void setBlock (int size, int block, Alloc a) { bucket[size][block] = a; }
    BuddyAllocator();



};

#endif //OS_PROJEKAT_BUDDYALLOCATOR_HPP
