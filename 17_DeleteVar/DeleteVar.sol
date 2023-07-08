// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DeleteVar {
    uint balance;

    // normal update balance: 22238 gas
    function update() external {
        balance = 1;
    }

    // update and delete: 2316 gas
    function updateDelete() external {
        balance = 1;
        delete balance;
    }

    // update and assign to default value: 2360 gas
    function updateDefault() external {
        balance = 1;
        balance = 0;
    }
}
