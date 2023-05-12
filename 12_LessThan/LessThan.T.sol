// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./LessThan.sol";

contract LessThanTest is Test {
    LessThan public lessThanContract;
    LessThanEqual public lessThanEqualContract;

    function setUp() public {
        lessThanContract = new LessThan();
        lessThanEqualContract = new LessThanEqual();
    }

    function testLessThan() public {
        lessThanContract.isLessThan(5);
    }

    function testLessThanEqual() public {
        lessThanEqualContract.isLessThan(5);
    }
}
