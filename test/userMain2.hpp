//
// Created by bogdan on 7.2.23..
//

#ifndef OS_PROJEKAT_USERMAIN2_HPP
#define OS_PROJEKAT_USERMAIN2_HPP
#include "../h/slab.h"
#include "../test/printing.hpp"




void memset(const void *data, int size, int value);
void construct(void *data);
int check(void *data, size_t size);
void runs(void(*work)(void*), struct data_s* data, int num);
void work(void* pdata);
void userMain2();
#endif //OS_PROJEKAT_USERMAIN2_HPP
