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

    static const int END_SIZE = 23;
    static const int START_SIZE = 12;
    static const int BUCKET_SIZE = 12;

    bool bucket[BUCKET_SIZE][1<<11]; // TODO nemoj da hardkodujes ove vrednosti
    int numOfBlocks[18];
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
    static uint64 roundToPow2(size_t x);
    static uint16 log2(uint64 n);
private:

    int getFreeBlock (int size) const;
    void* getBlockAddr(size_t size, int block) const;
    int getBlockAddr(size_t size, void* addr) const;
    void setBlock (size_t size, int block, bool a) { bucket[size][block] = a; }
    BuddyAllocator();



};

#endif //OS_PROJEKAT_BUDDYALLOCATOR_HPP
