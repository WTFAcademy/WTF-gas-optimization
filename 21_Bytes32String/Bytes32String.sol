// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SetBytes32 {
    bytes32 public b32;

    // use bytes32: 22222 gas
    function setBytes32() public {
        b32 = "Hello WTF!";
    }
}

contract SetString {
    string public str;

    // use string: 22682 gas
    function setString() public {
        str = "Hello WTF!";
    }
}
