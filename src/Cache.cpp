//
// Created by bogdan on 5.2.23..
//
#include "../h/Cache.hpp"


void *Cache::alloc() {

    if(!halfHead){

        if(!freeHead){
            freeHead = new _slab(objectSize, nullptr, nullptr, this->ctor, this->dtor);
            if(!freeHead)
                return nullptr;
        }

        // remove from free list move to half list
        _slab* slab = freeHead;

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
        halfHead = nullptr;
    }

    return obj;
}

void Cache::free(void *obj) {

    _slab* slab = nullptr;


    for(_slab* p = halfHead; p; p = p->getNext()){
        if(p->freeObject(obj) == 0){
            slab = p;

            if(!slab->isEmpty())
                break;

            // if empty move to free list
            // delete from half list
            if(slab == halfHead){
                halfHead = halfHead->getNext();
            }

            _slab* prev = slab->getPrev();
            _slab* next = slab->getNext();

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
        for(_slab* p = fullHead; p; p = p->getNext()){
            if(p->freeObject(obj) == 0){
                slab = p;
                // delete from full list
                if(slab == fullHead){
                    fullHead = fullHead->getNext();
                }

                _slab* prev = slab->getPrev();
                _slab* next = slab->getNext();

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
    return buddy_alloc(s);
}

void Cache::operator delete(void *p) {
    BuddyAllocator::getInstance().dealloc(p, sizeof(Cache));
}

Cache::~Cache() {
    for(_slab* p = fullHead; p;){
        _slab* q = p;
        p = p->getNext();
        delete q;
    }
    for(_slab* p = halfHead; p;){
        _slab* q = p;
        p = p->getNext();
        delete q;
    }
    for(_slab* p = freeHead; p;){
        _slab* q = p;
        p = p->getNext();
        delete q;
    }
}


