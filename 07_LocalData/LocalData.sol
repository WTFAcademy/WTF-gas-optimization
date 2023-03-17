// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LocalData {
    uint myCounter;

    function storageData(uint times) external {
        for (uint i; i < times; i++) {
            myCounter++;
        }
    }

    function localData(uint times) external {
        uint local_mycounter;
        for (uint i; i < times; i++) {
            local_mycounter++;
        }
        myCounter = local_mycounter;
    }
}
