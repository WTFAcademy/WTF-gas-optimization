// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Uint.sol";

contract UncheckedTest is Test {
    Uint public uintContract;

    function setUp() public {
        uintContract = new Uint();
    }

    function testGetA() public {
        uintContract.a();
    }

    function testGetB() public {
        uintContract.b();
    }

    function testGetC() public {
        uintContract.c();
    }

    function testGetD() public {
        uintContract.d();
    }

    function testGetE() public {
        uintContract.e();
    }

    function testGetF() public {
        uintContract.f();
    }

    function testSetA() public {
        uintContract.setA(11);
    }

    function testSetB() public {
        uintContract.setB(11);
    }

    function testSetC() public {
        uintContract.setC(11);
    }

    function testSetD() public {
        uintContract.setD(11);
    }

    function testSetE() public {
        uintContract.setE(11);
    }

    function testSetF() public {
        uintContract.setF(11);
    }
}
