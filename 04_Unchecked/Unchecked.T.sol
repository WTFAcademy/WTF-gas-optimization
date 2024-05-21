// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Unchecked.sol";

contract UncheckedTest is Test {
    Unchecked public uncheck;

    function setUp() public {
        uncheck = new Unchecked();
    }

    function testForNormal() public view {
        uncheck.forNormal(10000);
    }

    function testForUnckecked() public view {
        uncheck.forUnckecked(10000);
    }
}
