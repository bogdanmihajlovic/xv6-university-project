//
// Created by bogdan on 4.2.23..
//

#include "../h/_slab.hpp"

_slab::_slab(size_t slotSize, _slab *next, _slab *prev, Func ctor, Func dtor) : slotSize(slotSize), next(next), prev(prev), head(0), ctor(ctor), dtor(dtor){
    this->numOfSlots = 20; // todo bolje resenje
    this->numOfFreeSlots = this->numOfSlots;

    uint64 size = this->slotSize*this->numOfSlots;
    size = BuddyAllocator::roundToPow2(size);
    size = BuddyAllocator::log2(size);
    this->slots = BuddyAllocator::getInstance().alloc(size);

    size = sizeof(long)*this->numOfSlots;
    size = BuddyAllocator::roundToPow2(size);
    size = BuddyAllocator::log2(size);
    if(size < 5) // TODO min size
        size = 5;
    this->index = (long*)BuddyAllocator::getInstance().alloc(size);


    for(long i = 0; i < numOfSlots - 1; i++){
        index[i] = i + 1;
    }
    index[numOfSlots-1] = -1;
}

void *_slab::getObject() {

    if(numOfSlots == 0)
        return nullptr;


    void* obj = (void*)((char*)slots + head*slotSize);
    // TODO index[head] = ~(int64)0; sve jedince oznacavaju zauzetost

    head = index[head];
    numOfFreeSlots--;

    if(ctor)
        ctor(obj);

    return obj;
}

int _slab::freeObject(void *addr) {
    if (addr == nullptr || (char*)addr < (char*)slots || (char*)addr > (char*)slots + numOfSlots*slotSize)
        return -1; // Exception wrong address

    uint64 entry = ((uint64)addr - (uint64)slots) / slotSize;
    index[entry] = head;
    head = entry;
    numOfFreeSlots++;
    return 0;
}

void *_slab::operator new(size_t s) {
    size_t size = BuddyAllocator::roundToPow2(s);
    size = BuddyAllocator::log2(size);
    return BuddyAllocator::getInstance().alloc(size);

}

void _slab::operator delete(void *p) {
    size_t size = BuddyAllocator::roundToPow2(sizeof(_slab));
    size = BuddyAllocator::log2(size);
    BuddyAllocator::getInstance().dealloc(p, size);

}

bool _slab::isFull() const {
    return numOfFreeSlots == 0;
}

_slab::~_slab() {

    if(dtor){ // call destructor of objects
        for(unsigned i = 0;i < numOfSlots;i++){
            void* obj = (void*)((char*)slots + i*slotSize);
            dtor(obj);
        }
    }

    size_t size = this->slotSize*this->numOfSlots;
    size = BuddyAllocator::roundToPow2(size);
    size = BuddyAllocator::log2(size);
    BuddyAllocator::getInstance().dealloc(slots, (size_t)size);

    size = sizeof(long)*this->numOfSlots;
    size = BuddyAllocator::roundToPow2(size);
    size = BuddyAllocator::log2(size);
    BuddyAllocator::getInstance().dealloc((void*)index, (size_t)size);
    slots = nullptr;
    index = nullptr;


}
