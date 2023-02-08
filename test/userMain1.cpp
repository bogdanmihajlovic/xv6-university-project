
#include "../test/userMain1.hpp"





void userMain1() {
    ForkThread thread(1);

    thread.start();

    while (!thread.isFinished()) {
        thread_dispatch();
    }

    printString("User main finished\n");
}