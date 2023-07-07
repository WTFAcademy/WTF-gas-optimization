// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./MethodName.sol";

contract MethodNameTest is Test {
    MethodName public methodNameContract;
    MethodNameOpt public methodNameOptContract;

    function setUp() public {
        methodNameContract = new MethodName();
        methodNameOptContract = new MethodNameOpt();
    }

    function testMethodName() public {
        methodNameContract.test();
    }

    function testMethodNameOpt() public {
        methodNameOptContract.test_y2K();
    }
}
