//
// Created by bogdan on 5.2.23..
//
#include "../h/Cache.hpp"


void *Cache::alloc() {

    if(!halfHead){

        if(!freeHead){
            freeHead = new Slab(objectSize, ctor, dtor);
            if(!freeHead)
                return nullptr;
        }

        // remove from free list move to half list
        Slab* slab = freeHead;

        freeHead = freeHead->getNext();
        if(freeHead) freeHead->setPrev(nullptr);

        slab->setPrev(nullptr);
        slab->setNext(nullptr);
        halfHead = slab;

    }
    void* obj = halfHead->getObject();

    if(halfHead->isFull()){
        // move from half to full
        halfHead->setNext(fullHead);
        halfHead->setPrev(nullptr);
        if(fullHead) fullHead->setPrev(halfHead);
        fullHead = halfHead;
    }

    return obj;
}

void Cache::free(void *obj) {

    Slab* slab = nullptr;


    for(Slab* p = halfHead; p; p = p->getNext()){
        if(p->freeObject(obj) == 0){
            slab = p;

            if(!slab->isEmpty())
                break;

            // if empty move to free list
            // delete from half list
            if(slab == halfHead){
                halfHead = halfHead->getNext();
            }

            Slab* prev = slab->getPrev();
            Slab* next = slab->getNext();

            if(prev)
                prev->setNext(next);
            if(next)
                next->setPrev(prev);

            // add to empty list
            slab->setNext(freeHead);
            slab->setPrev(nullptr);
            freeHead = slab;
            break;
        }


    }

    if(!slab){
        for(Slab* p = fullHead; p; p = p->getNext()){
            if(p->freeObject(obj) == 0){
                slab = p;
                // delete from full list
                if(slab == fullHead){
                    fullHead = fullHead->getNext();
                }

                Slab* prev = slab->getPrev();
                Slab* next = slab->getNext();

                if(prev)
                    prev->setNext(next);
                if(next)
                    next->setPrev(prev);

                // add to half list
                slab->setNext(halfHead);
                slab->setPrev(nullptr);
                halfHead = slab;
                break;
            }
        }


    }



}

void *Cache::operator new(size_t s) {
    size_t size = BuddyAllocator::roundToPow2(s);
    size = BuddyAllocator::log2(size);
    return BuddyAllocator::getInstance().alloc(size);


}

void Cache::operator delete(void *p) {
    size_t size = BuddyAllocator::roundToPow2(sizeof(Cache));
    size = BuddyAllocator::log2(size);
    BuddyAllocator::getInstance().dealloc(p, size);

}

Cache::~Cache() {
    for(Slab* p = fullHead; p;){
        Slab* q = p;
        p = p->getNext();
        delete q;
    }
    for(Slab* p = halfHead; p;){
        Slab* q = p;
        p = p->getNext();
        delete q;
    }
    for(Slab* p = freeHead; p;){
        Slab* q = p;
        p = p->getNext();
        delete q;
    }
}


