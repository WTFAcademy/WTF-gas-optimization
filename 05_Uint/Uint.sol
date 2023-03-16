// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Uint {
    uint8 public Uint8 = 10;
    uint16 public Uint16 = 10;
    uint32 public Uint32 = 10;
    uint64 public Uint64 = 10;
    uint128 public Uint128 = 10;
    uint256 public Uint256 = 10;

    function setUint8(uint8 Uint8_) external {
        Uint8 = Uint8_;
    }

    function setUint16(uint16 Uint16_) external {
        Uint16 = Uint16_;
    }

    function setUint32(uint32 Uint32_) external {
        Uint32 = Uint32_;
    }

    function setUint64(uint64 Uint64_) external {
        Uint64 = Uint64_;
    }

    function setUint128(uint128 Uint128_) external {
        Uint128 = Uint128_;
    }

    function setUint256(uint256 Uint256_) external {
        Uint256 = Uint256_;
    }
}
