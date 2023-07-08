// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./InitDefault.sol";

contract MethodIdSortTest is Test {
    Default public defaultVar;
    InitDefault public initDefault;

    function setUp() public {
    }

    function testDefault() public {
        defaultVar = new Default();
    }

    function testInitDefault() public {
        initDefault = new InitDefault();
    }
}
