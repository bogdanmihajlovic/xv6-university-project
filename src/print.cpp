//
// Created by marko on 20.4.22..
//

#include "../h/print.hpp"
#include "../lib/console.h"
#include "../h/riscv.hpp"
uint64  lockPrint = 64;



void printString(char const *string){
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    while (*string != '\0')
    {
        __putc(*string);
        string++;
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
}

void printInteger(uint64 integer){
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    static char digits[] = "0123456789";
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0){
        neg = 1;
        x = -integer;
    } else{
        x = integer;
    }

    i = 0;
    do
    {
        buf[i++] = digits[x % 10];
    } while ((x /= 10) != 0);
    if (neg)
        buf[i++] = '-';

    while (--i >= 0)
        __putc(buf[i]);
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
}

char* getString(char *buf, int max) {
/*    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);*/
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
        cc = __getc();
        if(cc < 1)
            break;
        c = cc;
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
        printString("da ovde sam\n");
    }
    buf[i] = '\0';

    /*Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);*/
    return buf;
}

int stringToInt(const char *s) {
    int n;

    n = 0;
    while ('0' <= *s && *s <= '9')
        n = n * 10 + *s++ - '0';
    return n;
}
