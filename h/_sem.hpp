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

    int wait();
    int signal();
    int close();

protected:
    // block thread
    void block();

    // unblock thread
    void unblock();

private:
    _sem(int val) : value(val), active(true){}

    int value;
    bool active;
    List<TCB> blocked;

public:
    void *operator new(size_t );
    void *operator new[](size_t);
    void operator delete(void*);
    void operator delete[](void*);

};

#endif //OS_PROJEKAT__SEM_HPP
