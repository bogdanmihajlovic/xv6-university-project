//
// Created by bogdan on 31.8.22..
//

#ifndef OS_PROJEKAT_THREADTESTPERIODIC_HPP
#define OS_PROJEKAT_THREADTESTPERIODIC_HPP

#include "../h/syscall_cpp.hpp"
#include "../test/printing.hpp"

class ThreadTestPeriodic : public PeriodicThread {

public:
    ThreadTestPeriodic(int pid) : PeriodicThread(10){
        this->pid = pid;
    }

    void periodicActivation() override{
        printInt(pid);
        printString("\n");
    }
private:
    int pid;
};

#endif //OS_PROJEKAT_THREADTESTPERIODIC_HPP
