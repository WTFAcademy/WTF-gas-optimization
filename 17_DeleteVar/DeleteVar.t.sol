// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./DeleteVar.sol";

contract ShortCircuitTest is Test {
    DeleteVar public deleteVar;

    function setUp() public {
        deleteVar = new DeleteVar();
    }

    function testUpdate() public {
        deleteVar.update();
    }

    function testDelete() public {
        deleteVar.updateDelete();
    }

    function testDefault() public {
        deleteVar.updateDefault();
    }
}
