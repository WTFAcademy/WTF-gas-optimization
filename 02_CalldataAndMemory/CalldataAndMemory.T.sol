// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./CalldataAndMemory.sol";

contract CalldataAndMemoryTest is Test {
    CalldataAndMemory public calldataAndMemoryContract;

    function setUp() public {
        calldataAndMemoryContract = new CalldataAndMemory();
    }

    function testWriteByCalldata() public {
        calldataAndMemoryContract.writeByCalldata(
            CalldataAndMemory.Person({
                age: 16,
                name: "xiaoming",
                wish: "I want a pet dog."
            })
        );
    }

    function testWriteByMemory() public {
        calldataAndMemoryContract.writeByMemory(
           CalldataAndMemory.Person({
                age: 16,
                name: "xiaoming",
                wish: "I want a pet dog."
            })
        );
    }
}
