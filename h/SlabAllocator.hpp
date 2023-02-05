//
// Created by bogdan on 5.2.23..
//

#ifndef OS_PROJEKAT_SLABALLOCATOR_HPP
#define OS_PROJEKAT_SLABALLOCATOR_HPP
#include "../h/Cache.hpp"

// Singleton class
class SlabAllocator{
public:

    SlabAllocator(const SlabAllocator&) = delete;
    SlabAllocator(SlabAllocator&&) = delete;
    SlabAllocator& operator=(const SlabAllocator&) = delete;
    SlabAllocator& operator=(SlabAllocator&&) = delete;

    static SlabAllocator& getInstance();

    Cache* createCache(const char *name, size_t size,
                       void (*ctor)(void *),
                       void (*dtor)(void *));
    void* allocBuffer(size_t size);
    void deallocBuffer(void* obj);
    //~SlabAllocator();
private:
    SlabAllocator();

    void* space;
    int blocNum;
    Cache* memBuffer[13];
    Cache* buffer5;
};

#endif //OS_PROJEKAT_SLABALLOCATOR_HPP
