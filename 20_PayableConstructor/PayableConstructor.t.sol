// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./PayableConstructor.sol";

contract PayableConstructorTest is Test {
    Constructor public cons;
    PayableConstructor public payableCons;

    function setUp() public {
    }

    function testDefault() public {
        cons = new Constructor();
    }

    function testPayable() public {
        payableCons = new PayableConstructor();
    }
}
