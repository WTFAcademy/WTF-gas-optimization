// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LessThan {
    function isLessThan(uint256 num) external pure returns (bool) {
        return num < 6;
    }
}

contract LessThanEqual {
    function isLessThan(uint256 num) external pure returns (bool) {
        return num <= 5;
    }
}
