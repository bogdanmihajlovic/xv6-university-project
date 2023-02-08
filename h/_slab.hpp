//
// Created by bogdan on 4.2.23..
//

#ifndef OS_PROJEKAT__SLAB_HPP
#define OS_PROJEKAT__SLAB_HPP

#include "../lib/hw.h"
#include "../h/BuddyAllocator.hpp"


class _slab{
public:
    using Func = void(*)(void*);

    _slab(size_t slotSize, _slab* next, _slab* prev, Func ctor, Func dtor);

    void setNext(_slab* next) { this->next = next;}
    void setPrev(_slab* prev) { this->prev = prev; }
    _slab* getNext() const { return next; }
    _slab* getPrev() const {return prev;}

    bool isFull() const;
    bool isEmpty() const { return numOfSlots == numOfFreeSlots;}
    void* getObject();
    int freeObject(void* addr);
    int getNumOfObject() const { return numOfSlots - numOfFreeSlots;}
    int getSize() const { return (int)numOfSlots*slotSize;}
    int getNumOfSlots() const {return numOfSlots;}

    static void* operator new(size_t s);
    static void operator delete(void* p);

    ~_slab();
private:
    size_t slotSize;
    _slab* next, *prev;

    char* index;
    Func ctor;
    Func dtor;
    int numOfFreeSlots;
    int numOfSlots;
    void* slots;

    static int getNumOfSlots(size_t size);

};
#endif //OS_PROJEKAT__SLAB_HPP
