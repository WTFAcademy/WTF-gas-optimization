// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Normal{
    uint64 x = 5;
    uint256 y = 5;
    uint64 z = 5;
}

contract Packing {
    uint256 y = 5;
    uint64 x = 5;
    uint64 z = 5;
}