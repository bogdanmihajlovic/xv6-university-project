#include "../h/_buffer.hpp"


_buffer::_buffer(int _cap) : cap(_cap), head(0), tail(0) {
    buffer = (char*)mem_alloc(sizeof(char) * cap);
    sem_open(&itemAvailable, 0);
    sem_open(&spaceAvailable, _cap);
    sem_open(&mutexHead, 1);
    sem_open(&mutexTail, 1);
}

_buffer::_buffer() {

    sem_open(&itemAvailable, 0);
    sem_open(&spaceAvailable, DEFAULT_BUFFER_SIZE);
    sem_open(&mutexHead, 1);
    sem_open(&mutexTail, 1);
}
_buffer::~_buffer() {
    while (getCnt() > 0)
        head = (head + 1) % cap;


    //mem_free(buffer);
    sem_close(itemAvailable);
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void _buffer::put(char val) {
    sem_wait(spaceAvailable);
    sem_wait(mutexTail);

    buffer[tail] = val;
    tail = (tail + 1) % cap;

    sem_signal(mutexTail);
    sem_signal(itemAvailable);

}

char _buffer::get() {
    sem_wait(itemAvailable);
    sem_wait(mutexHead);

    char ret = buffer[head];
    head = (head + 1) % cap;

    sem_signal(mutexHead);
    sem_signal(spaceAvailable);

    return ret;
}

int _buffer::getCnt() {
    int ret;

    sem_wait(mutexHead);
    sem_wait(mutexTail);

    if (tail >= head) {
        ret = tail - head;
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    sem_signal(mutexHead);

    return ret;
}


char _buffer::kget() {

    itemAvailable->wait();
    mutexHead->wait();

    char ret = buffer[head];
    head = (head + 1) % cap;

    mutexHead->signal();
    spaceAvailable->signal();
    return ret;
}

void _buffer::kput(char val) {

    spaceAvailable->wait();
    mutexTail->wait();

    buffer[tail] = val;
    tail = (tail + 1) % cap;

    mutexTail->signal();
    itemAvailable->signal();
}
