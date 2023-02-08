//
// Created by bogdan on 5.2.23..
//
#include "../h/string_.h"


int atoi(const char* string){

    int num = 0;

    for (int i = 0; string[i] != '\0'; i++)
        num = num * 10 + (string[i] - '0');

    return num;
}

void strcpy(char* dest, const char* src) {
    for(int i = 0; src[i] != '\0'; i++)
        dest[i] = src[i];
}

size_t strlen(const char *str) {
    int len = 0;
    for(int i = 0; str[i] != '\0';i++) len++;
    return len;
}

int strcmp(const char *str1, const char *str2){
    while (*str1){
        if (*str1 != *str2)
            break;

        str1++;
        str2++;
    }

    return *(const unsigned char*)str1 - *(const unsigned char*)str2;
}

int strncmp(const char *str1, const char *str2, size_t n){
    int i = 0;
    while (*str1 && i < n){
        if (*str1 != *str2)
            break;
        i++;
        str1++;
        str2++;
    }

    return *(const unsigned char*)str1 - *(const unsigned char*)str2;
}