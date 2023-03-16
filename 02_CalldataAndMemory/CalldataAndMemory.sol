// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CalldataAndMemory {
    struct Person {
        uint16 age;
        string name;
        string wish;
    }

    Person xiaoming;
    Person xiaoming2;

    function writeByCalldata(Person calldata xiaoming_) external {
        xiaoming = xiaoming_;
    }

    function writeByMemory(Person memory xiaoming2_) external {
        xiaoming2 = xiaoming2_;
    }
}
