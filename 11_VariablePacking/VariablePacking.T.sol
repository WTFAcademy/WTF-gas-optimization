// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./VariablePacking.sol";
contract VariablePackingTest is Test {
    VariablePacking public variablePacking;

    function setUp() public {
        variablePacking = new VariablePacking();
    }

    function testVariablePackingBad() public {
        variablePacking.doBad();
    }

    function testVariablePackingGood() public {
        variablePacking.doGood();
    }
}