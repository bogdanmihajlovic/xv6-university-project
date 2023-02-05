//
// Created by bogdan on 5.2.23..
//

#include "../h/SlabAllocator.hpp"
#include "../h/string_.h"

SlabAllocator::SlabAllocator() : space(nullptr), blocNum(0) {
    char names[13][25] = {"size-5", "size-6", "size-7", "size-8", "size-9","size-10",
                          "size-11", "size-12", "size-13", "size-14", "size-15", "size-16", "size-17"};

    for(int i = 5; i < 18;i++) {
        memBuffer[i - 5] = new Cache(names[i - 5], 1 << i, nullptr, nullptr);
    }

}

SlabAllocator& SlabAllocator::getInstance() {
    static SlabAllocator instance;
    return instance;
}

Cache* SlabAllocator::createCache(const char *name, size_t size, void (*ctor)(void *), void (*dtor)(void *)) {
    return new Cache(name, size, ctor, dtor);
}

void *SlabAllocator::allocBuffer(size_t size) {
    if(size > 1<<17)
        return nullptr;

    if(size < 1<<5)
        size = 32;

   size = BuddyAllocator::roundToPow2(size);
   int entry = BuddyAllocator::log2(size) - 5;

   Cache* cache = memBuffer[entry];

    void* obj = cache->alloc();

    return obj;
}

void SlabAllocator::deallocBuffer(void *obj) {
    for(int i = 0;i < 13;i++)
        memBuffer[i]->free(obj);
}

/*

SlabAllocator::~SlabAllocator() {
    for(int i = 0;i < 13;i++)
        delete memBuffer[i];

}
*/



