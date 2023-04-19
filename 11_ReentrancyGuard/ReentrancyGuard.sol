// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
 
contract ReentrancyGuardBool{
    bool private locked  = false;
    modifier nonReentrant(){
        require(locked == false,"REENTRANCY");
        locked = true;
        _;
        locked = false;
    }
}


contract ReentrancyGuardUint01{
    uint256 private locked = 0;
    modifier nonReentrant(){
        require(locked == 0,"REENTRANCY");
        locked = 1;
        _;
        locked = 0;
    }
}


contract ReentrancyGuardUint12{
    uint256 private locked = 1;
    modifier nonReentrant(){
        require(locked == 1,"REENTRANCY");
        locked = 2;
        _;
        locked = 1;
    }
}



