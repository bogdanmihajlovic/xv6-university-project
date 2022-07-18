//
// Created by bogdan on 11.7.22..
//
#include "../test/MemoryAllocatorTest.hpp"

void printInteger(uint64 n){
    printInt(n);
    __putc('\n');
}

void printString(const char *string){
    char c;
    int i = 0;
    while((c=string[i++])!='\0') __putc(c);
}

void readString(char word[]){
    char c;
    int i = 0;
    while((c=__getc())!='\n') word[i++] = c;
}


void printInt(uint64 n){
    if (n < 0) {
        __putc('-');
        n = -n;
    }
    if (n/10)
        printInt(n/10);
    __putc(n%10 + '0');
}


void mallocFree(){
    printString("mallocFree\n");
    constexpr int num = 100;
    void* addrs[num];
    for(int i = 0; i<num;i++){
        addrs[i] = mem_alloc(100);
        if(addrs[i] == 0){
            printString("not ok\n");
            return;
        }
    }

    for(int i = 0 ; i<num ; i+=2){
        int retval = mem_free(addrs[i]);
        if(retval != 0){
            printString("not ok\n");
            return;
        }
    }

    for(int i = 0 ; i<num;i+=2){
        addrs[i] = mem_alloc(20);
        if(addrs[i] == 0){
            printString("not ok\n");;
            return;
        }
    }

    for(int i = 0; i<num;i++){
        int retval = mem_free(addrs[i]);
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
    void* p = mem_alloc(x);
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
        Test* t = (Test*)mem_alloc(sizeof(Test));
        if(t == 0)break;
        t->a = X;
        sum+=t->a;
        cnt++;
    }
    printInteger(cnt);
    printString("\n");
    if(sum == X*cnt) printString("ok\n");
    else printString("not ok\n");
}



void stressTesting(){
    printString("stressTesting\n");
    constexpr int num = 465;
    void* addrs[num];
    for(int i = 0; i<num;i++){
        printString("mem_alloc started\n");
        addrs[i] = mem_alloc(1);
        if(addrs[i] == 0){
            printString("not ok\n");
            return;
        }
    }
    int sz = 5;
    while(sz > 0){
        printString("sz:");
        printInteger(sz);
        for(int i = 0 ; i<num;i+=2){
            printString("i:");
            printInteger(i);
            printString("free\n");
            int retval = mem_free(addrs[i]);
            if(retval != 0){
                printString("not ok\n");
                return;
            }
            printString("alloc\n");
            addrs[i] = mem_alloc(sz*2);
            if(addrs[i] == 0){
                printString("not ok\n");;
                return;
            }
        }
        for(int i = 1 ; i<num;i+=2){
            printString("i:");
            printInteger(i);
            printString("free\n");
            int retval = mem_free(addrs[i]);
            if(retval != 0){
                printString("not ok\n");
                return;
            }
            printString("alloc\n");
            addrs[i] = mem_alloc(sz);
            if(addrs[i] == 0){
                printString("not ok\n");;
                return;
            }
        }
        sz-=10;
    }
    printString("ok\n");;
}

