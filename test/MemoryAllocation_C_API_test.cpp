//
// Created by bogdan on 27.7.22..
//

#include "MemoryAllocation_C_API_test.h"


void mallocFree(){
    printString("mallocFree\n");
    constexpr int num = 100;
    void* addrs[num];
    for(int i = 0; i<num;i++){
        addrs[i] = MemoryAllocator::getMemory(100);
        if(addrs[i] == 0){
            printString("not ok\n");
            return;
        }
    }

    for(int i = 0 ; i<num ; i+=2){
        int retval = MemoryAllocator::freeMemory(addrs[i]);
        if(retval != 0){
            printString("not ok\n");
            return;
        }
    }

    for(int i = 0 ; i<num;i+=2){
        addrs[i] = MemoryAllocator::getMemory(20);
        if(addrs[i] == 0){
            printString("not ok\n");;
            return;
        }
    }

    for(int i = 0; i<num;i++){
        int retval = MemoryAllocator::freeMemory(addrs[i]);
        if(retval != 0){
            printString("not ok\n");;
            return;
        }
    }

    printString("ok\n");;
}


void bigMalloc(){

    printString("big Malloc\n");;
    size_t x = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR + 100UL;
    void* p = MemoryAllocator::getMemory(x);
    if(p == 0) printString("ok\n");
    else printString("not ok\n");
}


void lotOfSmallMallocs(){

    printString("lotOfSmallMallocs\n");;
    uint64 cnt = 0;
    uint64 sum = 0;
    uint64 N = 1000000UL;
    uint64 X = 10UL;
    for(uint64 i = 0; i<N;i++){
        Test* t = (Test*)MemoryAllocator::getMemory(sizeof(Test));
        if(t == 0)break;
        t->a = X;
        sum+=t->a;
        cnt++;
    }
    printInt(cnt);
    printString("\n");
    if(sum == X*cnt) printString("ok\n");
    else printString("not ok\n");
}


void stressTesting(){
    printString("stressTesting\n");
    constexpr int num = 465;
    void* addrs[num];
    for(int i = 0; i<num;i++){
        addrs[i] = MemoryAllocator::getMemory(1);
        if(addrs[i] == 0){
            printString("not ok\n");
            return;
        }
    }
    int sz = 5;
    while(sz > 0){
        printString("sz:");
        printInt(sz);
        for(int i = 0 ; i<num;i+=2){
            printString("i:");
            printInt(i);
            printString("free\n");
            int retval = MemoryAllocator::freeMemory(addrs[i]);
            if(retval != 0){
                printString("not ok\n");
                return;
            }
            printString("alloc\n");
            addrs[i] = MemoryAllocator::getMemory(sz*2);
            if(addrs[i] == 0){
                printString("not ok\n");;
                return;
            }
        }
        for(int i = 1 ; i<num;i+=2){
            printString("i:");
            printInt(i);
            printString("free\n");
            int retval = MemoryAllocator::freeMemory(addrs[i]);
            if(retval != 0){
                printString("not ok\n");
                return;
            }
            printString("alloc\n");
            addrs[i] = MemoryAllocator::getMemory(sz);
            if(addrs[i] == 0){
                printString("not ok\n");;
                return;
            }
        }
        sz-=10;
    }
    printString("ok\n");;
}
