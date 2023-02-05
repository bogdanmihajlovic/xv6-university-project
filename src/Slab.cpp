//
// Created by bogdan on 4.2.23..
//

#include "../h/Slab.hpp"

Slab::Slab(size_t slotSize, Func ctor, Func dtor) : slotSize(slotSize), next(nullptr), prev(nullptr), head(0), ctor(ctor), dtor(dtor){

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

    this->head = 0;
    for(long i = 0; i < numOfSlots - 1; i++){
        index[i] = i + 1;
    }
    index[numOfSlots-1] = -1;
}

Slab::Slab(size_t slotSize, Slab *next, Slab *prev, Func ctor, Func dtor) : slotSize(slotSize), next(next), prev(prev), head(0), ctor(ctor), dtor(dtor){
    this->numOfSlots = 20;
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

void *Slab::getObject() {

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

int Slab::freeObject(void *addr) {
    if (addr == nullptr || (char*)addr < (char*)slots || (char*)addr > (char*)slots + numOfSlots*slotSize)
        return -1; // Exception wrong address

    uint64 entry = ((uint64)addr - (uint64)slots) / slotSize;
    index[entry] = head;
    head = entry;
    numOfFreeSlots++;
    return 0;
}

void *Slab::operator new(size_t s) {
    size_t size = BuddyAllocator::roundToPow2(s);
    size = BuddyAllocator::log2(size);
    return BuddyAllocator::getInstance().alloc(size);

}

void Slab::operator delete(void *p) {
    size_t size = BuddyAllocator::roundToPow2(sizeof(Slab));
    size = BuddyAllocator::log2(size);
    BuddyAllocator::getInstance().dealloc(p, size);

}

bool Slab::isFull() const {
    return numOfFreeSlots == 0;
}

Slab::~Slab() {

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
