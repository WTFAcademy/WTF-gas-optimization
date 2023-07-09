// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./FixedSize.sol";

contract FixedSizeTest is Test {
    FixedSize public fixedSize;
    
    function setUp() public {
        fixedSize = new FixedSize();
    }

    function testSetFixed() public {
        fixedSize.setFixedArr();
    }

    function testSetDyn() public {
        fixedSize.setDynArr();
    }
}
