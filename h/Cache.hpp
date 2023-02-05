//
// Created by bogdan on 4.2.23..
//

#ifndef OS_PROJEKAT_CACHE_HPP
#define OS_PROJEKAT_CACHE_HPP
#include "../h/Slab.hpp"
#include "../lib/hw.h"

class Cache{


public:
    using Func = void(*)(void*);

    Cache(const char* name, size_t objectSize, Func constructor, Func destructor): name(name), objectSize(objectSize), freeHead(nullptr), halfHead(nullptr), fullHead(nullptr), ctor(constructor), dtor(destructor) {
        freeHead = new Slab(objectSize, ctor, dtor);
    }

    void* alloc();
    void free(void* obj);
    void* shrink(); // TODO shrink
    void printInfo(); // TODO print info
    void printError(); // TODO print error

    static void* operator new(size_t s);
    static void operator delete(void* p);

    ~Cache();

private:

    const char* name;
    size_t objectSize;

    Slab* freeHead;
    Slab* halfHead;
    Slab* fullHead;
    Func ctor; // constructor
    Func dtor; // destructor

};

#endif //OS_PROJEKAT_CACHE_HPP
