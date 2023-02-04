//
// Created by bogdan on 4.2.23..
//

#include "../h/Slab.hpp"

Slab::Slab(size_t slotSize) : slotSize(slotSize), next(nullptr), prev(nullptr){

    this->numOfSlots = 20; // TODO optimalna vrednost

    uint64 size = this->slotSize*this->numOfSlots;
    size = BuddyAllocator::roundToPow2(size);
    this->slots = BuddyAllocator::getInstance().alloc(size);

    size = sizeof(uint64)*this->numOfSlots;
    size = BuddyAllocator::roundToPow2(size);
    this->index = (uint64*)BuddyAllocator::getInstance().alloc(size);

    this->head = 0;
    for(uint64 i = 0;i < numOfSlots - 1;i++){
        index[i] = i + 1;
    }
    index[numOfSlots-1] = -1;

}

Slab::Slab(size_t slotSize, Slab *next, Slab *prev) : slotSize(slotSize), next(next), prev(prev){

    this->numOfSlots = 20;
    uint64 size = this->slotSize*this->numOfSlots;
    size = BuddyAllocator::roundToPow2(size);
    this->slots = BuddyAllocator::getInstance().alloc(size);

    size = sizeof(uint64)*this->numOfSlots;
    size = BuddyAllocator::roundToPow2(size);
    this->index = (uint64*)BuddyAllocator::getInstance().alloc(size);

    this->head = 0;
    for(uint64 i = 0; i < numOfSlots - 1; i++){
        index[i] = i + 1;
    }
    index[numOfSlots-1] = -1;
}

void *Slab::getObject() {
    if(numOfSlots == 0)
        return nullptr;

    void* obj = (void*)((char*)slots + head*slotSize);
    // TODO index[head] = ~(int64)0; sve jedince oznacavaju zauzetost

    head = index[head];
    return obj;
}

int Slab::freeObject(void *addr) {
    if (addr == nullptr || (char*)addr < (char*)slots || (char*)addr > (char*)slots + numOfSlots*slotSize)
        return -1; // Exception wrong address

    uint64 entry = ((uint64)addr - (uint64)slots) / slotSize;
    index[entry] = head;
    head = entry;
    return 0;
}

void *Slab::operator new(size_t s) {
    return BuddyAllocator::getInstance().alloc(BuddyAllocator::roundToPow2(s));
}

void Slab::operator delete(void *p) {
    BuddyAllocator::getInstance().dealloc(p, BuddyAllocator::roundToPow2(sizeof(Slab)));
}
