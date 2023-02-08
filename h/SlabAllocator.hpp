//
// Created by bogdan on 5.2.23..
//

#ifndef OS_PROJEKAT_SLABALLOCATOR_HPP
#define OS_PROJEKAT_SLABALLOCATOR_HPP
#include "../h/Cache.hpp"

// Singleton class
class SlabAllocator{
public:

    enum kernelCacheEntry {TCB, SEM, LISTELEM, BUFFER, STACK};

    static int counter;
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
    void* allocKernel(size_t t, kernelCacheEntry entry);
    void deallocKernel(void* addr, kernelCacheEntry entry);
    //~SlabAllocator();
private:
    SlabAllocator();

    void* space;
    int blocNum;
    Cache* memBuffer[13];
    Cache* kernelCache[8];

    char names[13][25] = {"size-5", "size-6", "size-7", "size-8", "size-9","size-10",
                          "size-11", "size-12", "size-13", "size-14", "size-15", "size-16", "size-17"};
    //char namesKernel[3][25] = {"TCB-cache", "size", "size9-7"};
};

#endif //OS_PROJEKAT_SLABALLOCATOR_HPP
