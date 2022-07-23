/*
//
// Created by bogdan on 19.7.22..
//

#ifndef OS_PROJEKAT_SYSCALL_CPP_HPP
#define OS_PROJEKAT_SYSCALL_CPP_HPP
#include "../h/syscall_c.hpp"

*/
/*void* ::operator new (size_t t);
void ::operator delete (void*);*//*


class Thread {
public:
        Thread (void (*body)(void*), void* arg);
        virtual ~Thread ();

        int start ();
        static void dispatch ();
        static int sleep (time_t);

protected:
        Thread ();
        virtual void run () {}

 private:
       thread_t myHandle;
};

class Semaphore {
public:
        Semaphore (unsigned init = 1);
        virtual ~Semaphore ();
        int wait ();
        int signal ();
private:
      //  sem_t myHandle;
};

class PeriodicThread : public Thread {
protected:
        PeriodicThread (time_t period);
        virtual void periodicActivation () {}
};

class Console {
public:
        static char getc ();
        static void putc (char);
};

#endif //OS_PROJEKAT_SYSCALL_CPP_HPP
*/
