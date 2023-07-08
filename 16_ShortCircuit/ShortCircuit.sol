// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ShortCircuit {
    // gas consuming function
    function f() public pure returns (bool res) {
        uint result;
        for (uint256 i; i < 1000; i++) {
            result = i + 1;
        }
        res = true;
    }

    // low gas cosuming function
    function g() public pure returns (bool res) {
        res = true;
    }

    // No short circuit: gas 191,282
    function normal() external pure{
        f() || g();
        // f() && g();
    }

    // Short circuit: gas 120
    function shortCircuit() external pure{
        g() || f();
        // g() && f();
    }
}
