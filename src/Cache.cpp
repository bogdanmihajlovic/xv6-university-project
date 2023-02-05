//
// Created by bogdan on 5.2.23..
//
#include "../h/Cache.hpp"


void *Cache::alloc() {

    if(!halfHead){

        if(!freeHead){
            freeHead = new Slab(objectSize, nullptr, nullptr);
            if(!freeHead) return nullptr;
        }

        // remove from free list move to half list
        Slab* slab = freeHead;

        freeHead = freeHead->getNext();
        freeHead->setPrev(nullptr);

        slab->setPrev(nullptr);
        slab->setNext(nullptr);
        halfHead = slab;

    }
    void* obj = halfHead->getObject();

    if(halfHead->isFull()){
        // move from half to full
        halfHead->setNext(fullHead);
        halfHead->setPrev(nullptr);
        fullHead->setPrev(halfHead);
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


