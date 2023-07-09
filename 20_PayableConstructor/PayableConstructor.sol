// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// non-payable constructor: 67161 gas
contract Constructor {
    constructor() {} 
}

// payable constructor: 67102 gas
contract PayableConstructor {
    constructor() payable {} 
}
