//
// Created by bogdan on 4.2.23..
//

#ifndef OS_PROJEKAT_CACHE_HPP
#define OS_PROJEKAT_CACHE_HPP
#include "../h/Slab.hpp"
#include "../lib/hw.h"

class Cache{
private:
    const char* name;
    size_t objectSize;

    Slab* freeHead;
    Slab* halfHead;
    Slab* fullHead;


public:

    Cache(const char* name, size_t objectSize): name(name), objectSize(objectSize), freeHead(nullptr), halfHead(nullptr), fullHead(nullptr) {
        freeHead = new Slab(objectSize, nullptr, nullptr);
    }

    void* alloc();
    void free(void* obj);
    void* shrink();

    static void* operator new(size_t s);
    static void operator delete(void* p);

    ~Cache();

};

#endif //OS_PROJEKAT_CACHE_HPP
