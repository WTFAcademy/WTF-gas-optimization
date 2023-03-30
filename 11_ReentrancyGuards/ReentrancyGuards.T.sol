// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./ReentrancyGuards.sol";

contract ReentrancyGuardsTest is Test{
    ReentrancyGuardsBool reentrancyGuardsBool;
    ReentrancyGuardsUint01 reentrancyGuardsUint01;
    ReentrancyGuardsUint12 reentrancyGuardsUint12;

    function setUp() public {
    }

    function testDeployReentrancyGuardsBool() public {
        reentrancyGuardsBool = new ReentrancyGuardsBool();
    }

    function testDeployReentrancyGuardsUint01() public {
        reentrancyGuardsUint01 = new ReentrancyGuardsUint01();
    }

    function testDeployReentrancyGuardsUint12() public {
        reentrancyGuardsUint12 = new ReentrancyGuardsUint12();
    }
}