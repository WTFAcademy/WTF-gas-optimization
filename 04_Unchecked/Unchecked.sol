// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Unchecked {
    function forNormal(uint256 times) external pure returns (uint256 result) {
        for (uint256 i; i < times; i++) {
            result = i + 1;
        }
    }

    function forUnckecked(uint256 times) external pure returns (uint256 result) {
        for (uint256 i; i < times; ) {
            unchecked {
                result = i + 1;
                i++;
            }
        }
    }
}
