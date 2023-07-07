// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./MethodIdSort.sol";

contract MethodIdSortTest is Test {
    MethodIdSort public methodIdSortContract;

    function setUp() public {
        methodIdSortContract = new MethodIdSort();
    }

    function test1() public {
        methodIdSortContract.test1();
    }
    function test2() public {
        methodIdSortContract.test2();
    }

    function test3() public {
        methodIdSortContract.test3();
    }

    function test_y2K() public {
        methodIdSortContract.test_y2K();
    }
}
