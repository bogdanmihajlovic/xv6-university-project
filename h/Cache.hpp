//
// Created by bogdan on 4.2.23..
//

#ifndef OS_PROJEKAT_CACHE_HPP
#define OS_PROJEKAT_CACHE_HPP
#include "../h/_slab.hpp"
#include "../lib/hw.h"


class Cache{
public:
    using Func = void(*)(void*);

    Cache(const char* name, size_t objectSize, Func constructor, Func destructor) : objectSize(objectSize), halfHead(nullptr), fullHead(nullptr), ctor(constructor), dtor(destructor) {
        int len;
        for(len = 0; name[len] != '\0';len++) {
            this->name[len] = name[len];
        }
        this->name[len] = '\0';
        freeHead = new _slab(objectSize, nullptr, nullptr, ctor, dtor);
    }

    void* alloc();
    void free(void* obj);
    void shrink(); // TODO shrink
    void printInfo(); // TODO print info
    void printError(); // TODO print error

    static void* operator new(size_t s);
    static void operator delete(void* p);

    ~Cache();

private:

    char name[30];
    size_t objectSize;

    _slab* freeHead;
    _slab* halfHead;
    _slab* fullHead;
    Func ctor; // constructor
    Func dtor; // destructor
    void findInfo(int*, int*, int*, int*);
};

#endif //OS_PROJEKAT_CACHE_HPP
