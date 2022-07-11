//
// Created by bogdan on 10.7.22..
//

#include "../test/MemoryAllocatorTest.hpp"





int main(){

    MemoryAllocator& instance = MemoryAllocator::getInstance();

    stressTesting(instance);

    return 0;
}