// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./SwapVars.sol";

contract SwapVarsTest is Test {
    Swap public swap;
    DesSwap public desSwap;
    function setUp() public {
        swap = new Swap();
        desSwap = new DesSwap();
    }

    function testSwap() public view {
        swap.swap(1,2);
    }

    function testDesSwap() public view {
        desSwap.swap(1,2);
    }
}
