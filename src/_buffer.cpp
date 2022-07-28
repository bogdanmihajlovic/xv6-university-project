#include "../h/_buffer.hpp"
#include "../h/MemoryAllocator.hpp"


_buffer::_buffer() : cap(DEFAULT_BUFFER_SIZE + 1), head(0), tail(0) {

    buffer = (char*)MemoryAllocator::getMemory(sizeof(char)*DEFAULT_BUFFER_SIZE);
    _sem::createSemaphore(&itemAvailable, 0);
    _sem::createSemaphore(&spaceAvailable, DEFAULT_BUFFER_SIZE + 1);
    _sem::createSemaphore(&mutexHead, 1);
    _sem::createSemaphore(&mutexTail, 1);
}


_buffer::~_buffer() {
    while (getCnt() > 0)
        head = (head + 1) % cap;
    sem_close(itemAvailable);
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
    MemoryAllocator::freeMemory(buffer);
    buffer = nullptr;
    delete spaceAvailable;
    delete itemAvailable;
    delete mutexHead;
    delete mutexTail;
    printString("obrisao sam buffer\n");
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


void *_buffer::operator new(size_t size) {
    return MemoryAllocator::getMemory(size);
}

void *_buffer::operator new[](size_t size) {
    return MemoryAllocator::getMemory(size);
}

void _buffer::operator delete(void *addr) {
    MemoryAllocator::freeMemory(addr);
}

void _buffer::operator delete[](void *addr) {
    MemoryAllocator::freeMemory(addr);
}
