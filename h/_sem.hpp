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
    static int createSemaphore(sem_t* handle, unsigned value);

    void wait();
    void signal();
protected:
    void block();
    void unblock();
private:
    _sem(unsigned value) : value(value){}

    unsigned value;
    List<TCB> blocked;
};

#endif //OS_PROJEKAT__SEM_HPP
