// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Uint.sol";

contract UncheckedTest is Test {
    Uint public uintContract;

    function setUp() public {
        uintContract = new Uint();
    }

    function testGetUint8() public {
        uintContract.Uint8();
    }

    function testGetUint16() public {
        uintContract.Uint16();
    }

    function testGetUint32() public {
        uintContract.Uint32();
    }

    function testGetUint64() public {
        uintContract.Uint64();
    }

    function testGetUint128() public {
        uintContract.Uint128();
    }

    function testGetUint256() public {
        uintContract.Uint256();
    }

    function testSetUint8() public {
        uintContract.setUint8(11);
    }

    function testSetUint16() public {
        uintContract.setUint16(11);
    }

    function testSetUint32() public {
        uintContract.setUint32(11);
    }

    function testSetUint64() public {
        uintContract.setUint64(11);
    }

    function testSetUint128() public {
        uintContract.setUint128(11);
    }

    function testSetUint256() public {
        uintContract.setUint256(11);
    }
}
