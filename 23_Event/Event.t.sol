// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Event.sol";

contract EventTest is Test {
    Event public ev;
    
    function setUp() public {
        ev = new Event();
    }

    function testUseVar() public {
        ev.useVar();
    }

    function testUseEvent() public {
        ev.useEvent();
    }
}
