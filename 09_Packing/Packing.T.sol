// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Packing.sol";

contract PackingTest{
    Normal normal;
    Packing packing;

    function setUp() public {
    }

    function testDeployNormal() public {
        normal = new Normal();
    }

    function testDeployPacking() public {
        packing = new Packing();
    }
}