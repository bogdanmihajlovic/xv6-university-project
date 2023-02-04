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
    Slab* freeHead;
    Slab* fullHead;
    Slab* halfHead;
    size_t slabSize;
    size_t objectSize;
public:

    Cache(const char* name, size_t objectSize): name(name), objectSize(objectSize), halfHead(nullptr), fullHead(nullptr) {}

    void* alloc();
    void* shrink();
    void free();


};

#endif //OS_PROJEKAT_CACHE_HPP
