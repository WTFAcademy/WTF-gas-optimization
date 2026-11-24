// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./RequireString.sol";

contract RequireStringTest is Test {
    RequireString public requireString;

    function setUp() public {
        requireString = new RequireString();
    }

    function testShort() public {
        vm.expectRevert(bytes("Bad Balance"));
        requireString.shortString();
    }

    function testLong() public {
        vm.expectRevert(bytes("The era of digitalization has made the concept of instant gratification a norm, especially in financial transactions where the desire for seamless, effortless, and real-time processing is ever increasing. However, the swift and convenient completion of transactions is sometimes hindered by an obstacle that many of us are familiar with: insufficient account balance."));
        requireString.longString();
    }
}
