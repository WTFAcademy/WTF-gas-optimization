// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FixedSize {
    uint[] public uint_dyn_arr;
    uint[1000] public uint_fixed_arr;

    // fill dynamic-length array: 2,224,770 gas
    function setDynArr() public {
        for(uint i =0; i<99; i++){
            uint_dyn_arr.push(i);
        }
    }

    // fill fixed-length array: 2,182,608 gas
    function setFixedArr() public {
        for(uint i =0; i<99; i++){
            uint_fixed_arr[i] = i;
        }
    }
}
