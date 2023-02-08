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
    void* obj = nullptr;
    if(halfHead)
        obj = halfHead->getObject();
    else
        return nullptr;

    if(halfHead->isFull()){
        _slab* nextFullHead = halfHead->getNext();
        // move from half to full
        halfHead->setNext(fullHead);
        halfHead->setPrev(nullptr);
        if(fullHead) fullHead->setPrev(halfHead);
        fullHead = halfHead;
        halfHead = nextFullHead;
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
    return BuddyAllocator::getInstance().alloc(s);
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

void Cache::printInfo() {
    int sz, slab, nob, p;
    findInfo(&sz, &slab, &nob, &p);

    printString("name \tobject size \tcache size(blocks) \t\tslabs \t\tnumber of objects \t\t%\n");
    printString(name);
    printString(" \t");
    printInt(objectSize);
    printString("\t\t\t\t");
    printInt(sz);
    printString("\t\t\t\t\t\t");
    printInt(slab);
    printString("\t\t\t\t");
    printInt(nob);
    printString("\t\t\t\t");
    printInt(p);
    printString(" \n");

}

void Cache::findInfo(int* cacheSize, int* slabs, int* numberOfObjects, int* prs) {
    int i = 0;
    for(_slab* p = fullHead;p;p = p->getNext())i++;
    for(_slab* p = freeHead;p;p = p->getNext())i++;
    for(_slab* p = halfHead;p;p = p->getNext())i++;
    *slabs = i;

    i = 0;
    for(_slab* p = fullHead;p;p = p->getNext())i += p->getNumOfObject();
    //for(_slab* p = freeHead;p;p = p->getNext())i += p->getNumOfObject();
    for(_slab* p = halfHead;p;p = p->getNext())i += p->getNumOfObject();
    *numberOfObjects = i;

    i = 0;
    for(_slab* p = fullHead;p;p = p->getNext())i += p->getSize();
    for(_slab* p = freeHead;p;p = p->getNext())i += p->getSize();
    for(_slab* p = halfHead;p;p = p->getNext())i += p->getSize();

    *cacheSize = (i / 4096) + 1;
    int maxObj = 0;
    for(_slab* p = fullHead;p;p = p->getNext())maxObj += p->getNumOfSlots();
    for(_slab* p = freeHead;p;p = p->getNext())maxObj += p->getNumOfObject();
    for(_slab* p = halfHead;p;p = p->getNext())maxObj += p->getNumOfSlots();
    *prs = (int)(*numberOfObjects*100 / maxObj);

    if(fullHead) *numberOfObjects = fullHead->getNumOfSlots();
    else if(freeHead) *numberOfObjects = freeHead->getNumOfSlots();
    else if(halfHead) *numberOfObjects = halfHead->getNumOfSlots();



}

void Cache::printError() {
    printString("Error\n");
}

void Cache::shrink() {
    while(freeHead){
        _slab* q = freeHead;
        freeHead = freeHead->getNext();
        delete q;
    }

}


