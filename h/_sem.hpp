//
// Created by bogdan on 19.7.22..
//

#ifndef OS_PROJEKAT__SEM_HPP
#define OS_PROJEKAT__SEM_HPP
#include "../h/syscall_c.h"
#include "../h/list.hpp"
#include "../h/TCB.hpp"

class _sem{
public:
    static int createSemaphore(sem_t* handle, int value);

    void wait();
    void signal();
    int close();

protected:
    void block();
    void unblock();

private:
    _sem(int val) : value(val){}

public:
    int value;
    List<TCB> blocked;


    void *operator new(size_t );
    void *operator new[](size_t);
    void operator delete(void*);
    void operator delete[](void*);


};

#endif //OS_PROJEKAT__SEM_HPP
