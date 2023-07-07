// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./RequireString.sol";

contract MethodIdSortTest is Test {
    RequireString public requireString;

    function setUp() public {
        requireString = new RequireString();
    }

    function testShort() public view {
        requireString.shortString();
    }

    function testLong() public view {
        requireString.longString();
    }
}
