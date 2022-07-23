//
// Created by zika on 2/26/22.
//

#ifndef OS1_BUFFER_CPP_H
#define OS1_BUFFER_CPP_H

#include "../h/syscall_c.h"
#include "../h/_sem.hpp"

class _buffer {
private:
    friend class Riscv;
    int cap;
    char *buffer;
    int head, tail;

    sem_t spaceAvailable;
    sem_t itemAvailable;
    sem_t mutexHead;
    sem_t mutexTail;

    void kput(char val);
    char kget();

        friend class TCB;
public:
    _buffer(int cap);
    ~_buffer();

    void put(char val);
    char get();

    int getCnt();

};


#endif //OS1_BUFFER_CPP_H

