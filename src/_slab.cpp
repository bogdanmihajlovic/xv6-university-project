//
// Created by bogdan on 4.2.23..
//

#include "../h/_slab.hpp"

_slab::_slab(size_t slotSize, _slab *next, _slab *prev, Func ctor, Func dtor) : slotSize(slotSize), next(next), prev(prev), ctor(ctor), dtor(dtor), numOfFreeSlots(20), numOfSlots(20){

    this->numOfSlots = 20; // todo bolje resenje
    this->numOfFreeSlots = this->numOfSlots;


    size_t size = this->slotSize*this->numOfSlots;
    //this->slots = buddy_alloc(size);
    this->slots = mem_alloc(size);

    size = this->numOfSlots;
    //this->index = (char*) buddy_alloc(size);
    this->index = (char*)mem_alloc(size);

    for(int i = 0;i < numOfSlots; i++) index[i] = 0;

}

void *_slab::getObject() {

    if(numOfSlots == 0)
        return nullptr;

    int free = 0;

    while(index[free] == 1)free++;

    void* obj = (void*) ((char*)slots + free*slotSize);
    // TODO index[head] = ~(int64)0; sve jedince oznacavaju zauzetost
    index[free] = 1;
    //head = index[head];
    numOfFreeSlots--;

    if(ctor)
        ctor(obj);

    return obj;
}

int _slab::freeObject(void *addr) {
    if (addr == nullptr || (char*)addr < (char*)slots || (char*)addr > (char*)slots + numOfSlots*slotSize)
        return -1; // Exception wrong address

    int entry = ((char*)addr - (char*)slots) / slotSize;
    index[entry] = 0;
    numOfFreeSlots++;
    return 0;
}

void *_slab::operator new(size_t s) {
    return buddy_alloc(s);
}

void _slab::operator delete(void *p) {
    BuddyAllocator::getInstance().dealloc(p, sizeof(_slab));
}

bool _slab::isFull() const {
    return numOfFreeSlots == 0;
}

_slab::~_slab() {

/*
    if(dtor){ // call destructor of objects
        for(int i = 0;i < numOfSlots; i++){
            void* obj = (void*)((char*)slots + i*slotSize);
            dtor(obj);
        }
    }
*/

    size_t size = this->slotSize*this->numOfSlots;
    BuddyAllocator::getInstance().dealloc(slots, size);

    size = sizeof(int)*this->numOfSlots;
    BuddyAllocator::getInstance().dealloc((void*)index, size);

    slots = nullptr;
    index = nullptr;

}
