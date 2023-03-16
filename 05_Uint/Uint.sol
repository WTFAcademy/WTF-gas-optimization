// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Uint {
    uint8 public a = 10;
    uint16 public b = 10;
    uint32 public c = 10;
    uint64 public d = 10;
    uint128 public e = 10;
    uint256 public f = 10;

    function setA(uint8 a_) external {
        a = a_;
    }

    function setB(uint16 b_) external {
        b = b_;
    }

    function setC(uint32 c_) external {
        c = c_;
    }

    function setD(uint64 d_) external {
        d = d_;
    }

    function setE(uint128 e_) external {
        e = e_;
    }

    function setF(uint256 f_) external {
        f = f_;
    }
}
