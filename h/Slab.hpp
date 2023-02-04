//
// Created by bogdan on 4.2.23..
//

#ifndef OS_PROJEKAT_SLAB_HPP
#define OS_PROJEKAT_SLAB_HPP

#include "../lib/hw.h"
#include "../h/BuddyAllocator.hpp"

class Slab{
public:

    Slab(size_t slotSize);
    Slab(size_t slotSize, Slab* next, Slab* prev);

    void setNext(Slab* next) { this->next = next;}
    void setPrev(Slab* prev) {this->prev = prev; }

    void* getObject();
    int freeObject(void* addr);

    static void* operator new(size_t s);
    static void operator delete(void* p);

private:

    Slab* next, *prev;
    size_t slotSize;
    uint64 head;
    unsigned numOfFreeSlots;
    unsigned numOfSlots;
    void* slots;
    uint64* index;

};
#endif //OS_PROJEKAT_SLAB_HPP
