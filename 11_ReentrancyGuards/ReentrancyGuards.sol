// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
 
contract ReentrancyGuardsBool{
    bool private locked  = false;
    modifier nonReentrantBool(){
        require(locked == false,"REENTRANCY");
        locked = true;
        _;
        locked = false;
    }
}


contract ReentrancyGuardsUint01{
    uint256 private locked = 0;
    modifier nonReentrant01(){
        require(locked == 0,"REENTRANCY");
        locked = 1;
        _;
        locked = 0;
    }
}


contract ReentrancyGuardsUint12{
    uint256 private locked = 1;
    modifier nonReentrant12(){
        require(locked == 1,"REENTRANCY");
        locked = 2;
        _;
        locked = 1;
    }
}



