// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Bytes32String.sol";

contract Bytes32StringTest is Test {
    SetBytes32 public b32;
    SetString public str;
    
    function setUp() public {
        b32 = new SetBytes32();
        str = new SetString();
    }

    function testSetString() public {
        str.setString();
    }

    function testSetBytes32() public {
        b32.setBytes32();
    }
}
