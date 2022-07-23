//
// Created by marko on 20.4.22..
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_PRINT_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_PRINT_HPP

#include "../lib/hw.h"

extern void printString(char const *string);

extern "C" uint64 copy_and_swap(uint64 &lock, uint64 expected, uint64 desired);

extern void printInteger(uint64 integer);

extern void readString(char []);

int stringToInt(const char *s);

char* getString(char *buf, int max);
#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_PRINT_HPP
