// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Uint8Test {
    uint8 public Uint8;

    // gas 22234
    function setUint8() external {
        Uint8 = 1;
    }

    // gas 53427
    function useUint8() external returns (uint8) {
        uint8 selectedRange = 50;
        for (uint8 i=0; i < selectedRange; i++) {
            Uint8 += 1;
        }
        return Uint8;
    }
}

contract Uint32Test {
    uint32 public Uint32;

    // gas 22234
    function setUint32() external {
        Uint32 = 1;
    }

    // gas 53895
    function useUint32() external returns (uint32) {
        uint32 selectedRange = 50;
        for (uint32 i=0; i < selectedRange; i++) {
            Uint32 += 1;
        }
        return Uint32;
    }
}

contract Uint256Test {
    uint256 public Uint256;
    // gas 22238
    function setUint256() external {
        Uint256 = 1;
    }

    // gas 42950
    function useUint256() external returns (uint) {
        uint selectedRange = 50;
        for (uint i=0; i < selectedRange; i++) {
            Uint256 += 1;
        }
        return Uint256;
    }
}

