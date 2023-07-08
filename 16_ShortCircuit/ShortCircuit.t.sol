// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./ShortCircuit.sol";

contract ShortCircuitTest is Test {
    ShortCircuit public shortCircuit;

    function setUp() public {
        shortCircuit = new ShortCircuit();
    }

    function testShort() public view {
        shortCircuit.shortCircuit();
    }

    function testNormal() public view {
        shortCircuit.normal();
    }
}
