// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Increment.sol";

contract IncrementTest {
    Increment1 increment1;
    Increment2 increment2;
    Increment3 increment3;
    Increment4 increment4;

    function setUp() public {
        increment1 = new Increment1();
        increment2 = new Increment2();
        increment3 = new Increment3();
        increment4 = new Increment4();
    }

    function testIncrement1() public {
        increment1.increment1();
    }

    function testIncrement2() public {
        increment2.increment2();
    }

    function testIncrement3() public {
        increment3.increment3();
    }

    function testIncrement4() public {
        increment4.increment4();
    }
}
