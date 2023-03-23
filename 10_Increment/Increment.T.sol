// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Increment.sol";

contract IncrementTest {
    Increment increment;

    function setUp() public {
        increment = new Increment();
    }

    function testIncrement() public {
        increment.increment();
    }

    function testIncrement2() public {
        increment.increment2();
    }

    function testIncrement3() public {
        increment.increment3();
    }

    function testIncrement4() public {
        increment.increment4();
    }
}
