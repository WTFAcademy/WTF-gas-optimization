// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Swap {
    // normal swap 2 variables: 282 gas
    function swap(uint x, uint y) public pure returns(uint, uint){
        uint z = y;
        y = x;
        x = z;
        return (x, y);
    }
}

// This will not help you to save gas, but it makes your code look better.
contract DesSwap{
    // swap 2 variables with destructuring assignment: 282 gas 
    function swap(uint x, uint y) public pure returns(uint, uint){
        (x, y) = (y, x);
        return (x, y);
    }
}
