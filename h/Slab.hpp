//
// Created by bogdan on 4.2.23..
//

#ifndef OS_PROJEKAT_SLAB_HPP
#define OS_PROJEKAT_SLAB_HPP

#include "../lib/hw.h"
#include "../h/BuddyAllocator.hpp"
#include "../h/syscall_cpp.hpp"

class Slab{
public:

    Slab(size_t slotSize);
    Slab(size_t slotSize, Slab* next, Slab* prev);

    void setNext(Slab* next) { this->next = next;}
    void setPrev(Slab* prev) {this->prev = prev; }
    Slab* getNext() const { return next; }
    Slab* getPrev() const {return prev;}

    bool isFull() const;
    bool isEmpty() const { return numOfSlots == numOfFreeSlots;}
    void* getObject();
    int freeObject(void* addr);

    static void* operator new(size_t s);
    static void operator delete(void* p);

    ~Slab();
private:
    size_t slotSize;
    Slab* next, *prev;
    long head;
    unsigned numOfFreeSlots;
    unsigned numOfSlots;
    void* slots;
    long* index;

};
#endif //OS_PROJEKAT_SLAB_HPP
