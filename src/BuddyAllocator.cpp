//
// Created by bogdan on 1.2.23..
//

#include "../h/BuddyAllocator.hpp"
const int BuddyAllocator::START_SIZE = 5;
const int BuddyAllocator::END_SIZE = 23;
const int BuddyAllocator::BUCKET_SIZE = 18;


BuddyAllocator::BuddyAllocator () {
    START_ADDR = HEAP_START_ADDR;
    for (int i = 17, nblks = 1; i >= 0; i--, nblks *= 2){
        numOfBlocks[i] = nblks;
    for (int j = 0; j < nblks; j++) {
        bucket[i][j] = ALLOC;
    }
   }

    bucket[17][0] = FREE;

}

BuddyAllocator &BuddyAllocator::getInstance() {
    static BuddyAllocator instance;
    return instance;
}


inline int BuddyAllocator::getFreeBlock (int size) const {
    for (int i = 0; i < numOfBlocks[size]; i++) {
        if (bucket[size][i] == FREE)
            return i;
    }
    return -1;
}

void *BuddyAllocator::getBlockAddr(size_t size, int block) const {
    size_t offset = 1<<size;
    return (void*)((char*)START_ADDR + offset*block);
}

void* BuddyAllocator::alloc (size_t size) {

    int newSize = log2(roundToPow2(size));
    if (newSize >= END_SIZE) {
     return nullptr; // Exception
    }

    newSize = (newSize < START_SIZE) ? START_SIZE : newSize;
    newSize = newSize - START_SIZE;
    int block = -1;
    int current = newSize;

    for (; block<0 && current<BUCKET_SIZE; current++) {
        block = getFreeBlock(current);
    }

    if (block<0)
        return nullptr; // No available memory

    setBlock(--current,block,ALLOC);
    while (--current >= newSize) {
        block *= 2;
        setBlock(current,block+1,FREE);
    }
    return getBlockAddr(newSize,block);
}

inline int BuddyAllocator::getBlockAddr(size_t size, void *addr) const {
    int block = ((int)((size_t)addr - (size_t)START_ADDR))/(1<<size);
    return block;
}

void BuddyAllocator::dealloc(void *addr, size_t size) {
    int newSize = log2(roundToPow2(size));
    newSize = (newSize < START_SIZE) ? START_SIZE : newSize;
    int block = getBlockAddr(newSize, addr);
    newSize = newSize - START_SIZE;
    setBlock(newSize, block, FREE);
    int j = block;
    for(int i = newSize;i < BUCKET_SIZE - 1;i++){
        int b1 = (j % 2 == 0) ? j : j - 1;
        int b2 = b1 + 1;
        if(bucket[i][b1] == FREE && bucket[i][b2] == FREE){
            setBlock(i, b1, ALLOC);
            setBlock(i, b2, ALLOC);
            j = b1/2;
            setBlock(i+1, j, FREE);
        }else{
            break;
        }

    }

}

int BuddyAllocator::countFree() const {
    int count = 0;
    for(int i = 0;i < BUCKET_SIZE;i++){
        for (int j = 0; j < numOfBlocks[i]; j++)
            if (bucket[i][j]==FREE)
                count++;
    }
    return count;
}

uint64 BuddyAllocator::roundToPow2(uint64 x) {
        uint64 power = 2;
        x--;
        while (x >>= 1) power <<= 1;
        return power;
}

uint16 BuddyAllocator::log2(uint64 n) {
    if (n==0)
        return 0;
    uint16 logValue = -1;
    while (n) {//
        logValue++;
        n >>= 1;
    }
    return logValue;

}
