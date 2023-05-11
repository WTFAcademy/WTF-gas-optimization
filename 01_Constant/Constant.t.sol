// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./Constant.sol";

contract ConstantTest is Test {
    Constant public constantContract;
    Immutable public immutableContract;
    Public public publicContract;

    function setUp() public {
        constantContract = new Constant();
        immutableContract = new Immutable();
        publicContract = new Public();
    }

    function testConstant() public view {
        constantContract.varConstant();
    }

    function testImmutable() public view {
        immutableContract.varImmutable();
    }

    function testVariable() public view {
        publicContract.variable();
    }
}
