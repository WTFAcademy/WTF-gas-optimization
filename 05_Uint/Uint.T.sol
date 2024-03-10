// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Uint.sol";

contract UintTest is Test {
    Uint8Test public uint8Test;
    Uint32Test public uint32Test;
    Uint256Test public uint256Test;

    function setUp() public {
        uint8Test = new Uint8Test();
        uint32Test = new Uint32Test();
        uint256Test = new Uint256Test();
    }

    // read uint variable
    function testReadUint8() public view {
        uint8Test.Uint8();
    }

    function testReadUint32() public view {
        uint32Test.Uint32();
    }

    function testReadUint256() public view {
        uint256Test.Uint256();
    }

    // set uint variable
    function testSetUint8() public {
        uint8Test.setUint8();
    }

    function testSetUint32() public {
        uint32Test.setUint32();
    }

    function testSetUint256() public {
        uint256Test.setUint256();
    }

    // use uint variable in loops
    function testUseUint8() public {
        uint8Test.useUint8();
    }

    function testUseUint32() public {
        uint32Test.useUint32();
    }

    function testUseUint256() public {
        uint256Test.useUint256();
    }
}
