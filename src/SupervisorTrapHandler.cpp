
#include "../h/SupervisorTrapHandler.hpp"





extern "C" void supervisorTrapHandler(){
    uint64 a0, a1, a2, a3, a4, a5, a6, a7;

    __asm__ ("a7, %[var]": [var]  "=r"(a7));
    __asm__ ("a6, %[var]": [var]  "=r"(a6));
    __asm__ ("a5, %[var]": [var]  "=r"(a5));
    __asm__ ("a4, %[var]": [var]  "=r"(a4));
    __asm__ ("a3, %[var]": [var]  "=r"(a3));
    __asm__ ("a2, %[var]": [var]  "=r"(a2));
    __asm__ ("a1, %[var]": [var]  "=r"(a1));
    __asm__ ("a0, %[var]": [var]  "=r"(a0));

    uint64 scause = Riscv::r_scause();
    uint64 sstatus = Riscv::r_sstatus();

    if(scause == 0x08 || scause == 0x09){

    }
    //__putc('t');
    console_handler();

};