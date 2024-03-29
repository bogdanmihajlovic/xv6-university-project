//
// Created by bogdan on 7.2.23..
//

#ifndef OS_PROJEKAT_USERMAIN1_HPP
#define OS_PROJEKAT_USERMAIN1_HPP

#include "../h/syscall_c.h"
#include "../h/syscall_cpp.hpp"
#include "../test/printing.hpp"

struct thread_data {
    int id;
};


class ForkThread : public Thread {
public:
    ForkThread(long _id) noexcept: Thread(), id(_id), finished(false) {}
    virtual void run() {
        printString("Started thread id: ");
        printInt(id);
        putc('\n');
        ForkThread* thread = new ForkThread(id + 1);
        ForkThread** threads = (ForkThread** ) mem_alloc(sizeof(ForkThread*) * id);

        if (threads != nullptr) {
            for (long i = 0; i < id; i++) {
                threads[i] = new ForkThread(id);
            }

            if (thread != nullptr) {
                if (thread->start() == 0) {

                    for (int i = 0; i < 50; i++) {
                        for (int j = 0; j < 50; j++) {

                        }
                        thread_dispatch();
                    }

                    while (!thread->isFinished()) {
                        thread_dispatch();
                    }
                }
                delete thread;
            }

            for (long i = 0; i < id; i++) {
                delete threads[i];
            }

            mem_free(threads);
        }

        printString("Finished thread id: ");
        printInt(id);
        putc('\n');
        finished = true;
    }

    bool isFinished() const {
        return finished;
    }

private:
private:
    long id;
    bool finished;
};

void userMain1();

#endif //OS_PROJEKAT_USERMAIN1_HPP
