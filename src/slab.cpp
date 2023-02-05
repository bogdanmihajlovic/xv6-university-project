//
// Created by bogdan on 5.2.23..
//
#include "../h/slab.h"
#include "../h/SlabAllocator.hpp"

kmem_cache_t *kmem_cache_create(const char *name, size_t size, void (*ctor)(void *), void (*dtor)(void *)) {
    kmem_cache_t* cache = (kmem_cache_t*)SlabAllocator::getInstance().createCache(name, size, ctor, dtor);
    return cache;
}

int kmem_cache_shrink(kmem_cache_t *cachep) {
   //Cache* c = (Cache*)cachep;
    //c->cring();
    return 0;
}

void* kmem_cache_alloc(kmem_cache_t *cachep) {
    Cache* c = (Cache*)cachep;
    return c->alloc();;
}

void kmem_cache_free(kmem_cache_t* cachep, void *objp) {
    Cache* c = (Cache*)cachep;
    c->free(objp);
}

void* kmalloc(size_t size) {
    return SlabAllocator::getInstance().allocBuffer(size);
}

void kfree(void *objp) {
   SlabAllocator::getInstance().deallocBuffer(objp);
}


void kmem_cache_destroy(Cache *cachep) {
    Cache* c = (Cache*)cachep;
    delete c;
}

void kmem_cache_info(Cache *cachep) {

}

int kmem_cache_error(kmem_cache_t *cachep) {
    return 0;
}