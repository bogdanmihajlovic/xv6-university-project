//
// Created by bogdan on 4.2.23..
//

#include "../h/_slab.hpp"

_slab::_slab(size_t slotSize, _slab *next, _slab *prev, Func ctor, Func dtor) : slotSize(slotSize), next(next), prev(prev), ctor(ctor), dtor(dtor){

    //this->numOfSlots = (slotSize < 4069) ? (4096/(int)slotSize)  : 1; // radi za drugi test
    //this->numOfSlots = 8; // radi za prvi test
    this->numOfSlots = (slotSize + (4096/slotSize) < 4069) ? (4096/(int)slotSize)  : 1; // radi za drugi test

    //this->numOfSlots = getNumOfSlots(slotSize);
    this->numOfFreeSlots = this->numOfSlots;

    //this->slots = BuddyAllocator::getInstance().alloc(this->slotSize*this->numOfSlots);
    //this->index = (char*)BuddyAllocator::getInstance().alloc(this->numOfSlots*sizeof(char));

    void* mem = BuddyAllocator::getInstance().alloc(this->numOfSlots*sizeof(char) + this->numOfSlots*slotSize);
    this->index = (char*)mem;
    if(mem)
        this->slots = (void*)((char*)mem + this->numOfSlots*sizeof(char));

    if(mem){
        for(int i = 0;i < numOfSlots; i++)
            index[i] = 0;
    }

}

void *_slab::getObject() {

    if(numOfSlots == 0)
        return nullptr;

    int free = 0;

    if(!index || !slots)
        return nullptr;

    while(index[free] == 1)
        free++;

    void* obj = (void*) ((char*)slots + free*slotSize);

    index[free] = 1;
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
    return BuddyAllocator::getInstance().alloc(s);
    //return mem_alloc(s);
}

void _slab::operator delete(void *p) {
    BuddyAllocator::getInstance().dealloc(p, sizeof(_slab));
    //mem_free(p);
}

bool _slab::isFull() const {
    return numOfFreeSlots == 0;
}

_slab::~_slab() {


    if(dtor){ // call destructor of objects
        for(int i = 0;i < numOfSlots; i++){
            void* obj = (void*)((char*)slots + i*slotSize);
            dtor(obj);
        }
    }


    //size_t size = this->slotSize*this->numOfSlots;
    //BuddyAllocator::getInstance().dealloc(slots, size);

    //size = sizeof(int)*this->numOfSlots;
    //BuddyAllocator::getInstance().dealloc((void*)index, size);

    BuddyAllocator::getInstance().dealloc((void*)index, this->numOfSlots*sizeof(char) + this->numOfSlots*slotSize);
    slots = nullptr;
    index = nullptr;

}

int _slab::getNumOfSlots(size_t size) {

    if(size + (4096/size) < 4069){
        return 4096 / (int)size;
    }

    size_t minFragment = 1 << 25;
    int j = 1;


    for(int i = (int)BuddyAllocator::roundToPow2(size); i <= 1<<15;i++){
        size_t fragment = i % size;
        if(fragment < minFragment){
            minFragment = fragment;
            j = i / (int)size;
        }
    }
    return j;

}
