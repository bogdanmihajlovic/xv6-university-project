//
// Created by zika on 2/26/22.
//

#ifndef OS_PROJEKAT__BUFFER_CPP_H
#define OS_PROJEKAT__BUFFER_CPP_H


#include "../h/_sem.hpp"

class _buffer {
private:
    friend class Riscv;
    int cap;
    char* buffer;
    int head, tail;

    sem_t spaceAvailable;
    sem_t itemAvailable;
    sem_t mutexHead;
    sem_t mutexTail;

    // put for kernel
    void kput(char val);

    // get for kernel
    char kget();

    friend class TCB;
public:

    _buffer();
    ~_buffer();

    void put(char val);
    char get();

    int getCnt();

    void *operator new(size_t );
    void *operator new[](size_t);
    void operator delete(void*);
    void operator delete[](void*);

};


#endif //OS1_BUFFER_CPP_H

