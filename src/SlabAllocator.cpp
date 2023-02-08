//
// Created by bogdan on 5.2.23..
//

#include "../h/SlabAllocator.hpp"

int SlabAllocator::counter = 0;


SlabAllocator::SlabAllocator() : space(nullptr), blocNum(0) {

    for(int i = 5; i < 18;i++) {
        memBuffer[i - 5] = nullptr;
    }

    for(int i = 0;i < 8;i++){
        kernelCache[i] = nullptr;
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


    if(memBuffer[entry] == nullptr){
        memBuffer[entry] = new Cache(names[entry], 1 << (entry + 5), nullptr, nullptr);
        if(memBuffer[entry] == nullptr)
            return nullptr;
    }
    Cache* cache = memBuffer[entry];
    void* obj = cache->alloc();

    return obj;
}

void SlabAllocator::deallocBuffer(void *obj) {
    for(int i = 0;i < 13;i++)
        if(memBuffer[i]) memBuffer[i]->free(obj);
}


void *SlabAllocator::allocKernel(size_t size, SlabAllocator::kernelCacheEntry entry) {

    if(kernelCache[entry] == nullptr){
        kernelCache[entry] = new Cache("dfadfd", size, nullptr, nullptr); // TODO set names
        if(kernelCache[entry] == nullptr)
            return nullptr;
    }
    return kernelCache[entry]->alloc();
}

void SlabAllocator::deallocKernel(void *addr, SlabAllocator::kernelCacheEntry entry) {

    if(kernelCache[entry]){
            kernelCache[entry]->free(addr);
    }

}



/*

SlabAllocator::~SlabAllocator() {
*/
/*    for(int i = 0;i < 13;i++)
        delete memBuffer[i];*//*

}
*/




