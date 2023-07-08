// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Default {
    uint256 foo; // good: 67148 gas
}

contract InitDefault {
    uint256 foo = 0;// bad: 69332 gas
}
