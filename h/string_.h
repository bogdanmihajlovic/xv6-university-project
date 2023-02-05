//
// Created by bogdan on 5.2.23..
//

#ifndef OS_PROJEKAT_STRING__H
#define OS_PROJEKAT_STRING__H
#include "../lib/hw.h"

size_t strlen(const char* str);
char* strcpy(char *dest, const char * src);
int strcmp(const char *str1, const char *str2);
int strncmp(const char *str1, const char *str2, size_t n);
int atoi(const char* string);

#endif //OS_PROJEKAT_STRING__H
