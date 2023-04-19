// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./ReentrancyGuard.sol";

contract ReentrancyGuardTest is Test{
    ReentrancyGuardBool reentrancyGuardBool;
    ReentrancyGuardUint01 reentrancyGuardUint01;
    ReentrancyGuardUint12 reentrancyGuardUint12;

    function setUp() public {
    }

    function testDeployReentrancyGuardBool() public {
        reentrancyGuardBool = new ReentrancyGuardBool();
    }

    function testDeployReentrancyGuardUint01() public {
        reentrancyGuardUint01 = new ReentrancyGuardUint01();
    }

    function testDeployReentrancyGuardUint12() public {
        reentrancyGuardUint12 = new ReentrancyGuardUint12();
    }
}