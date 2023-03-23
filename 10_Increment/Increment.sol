// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Increment {
    function increment() external {
        uint num;
        num += 1;
    }

    function increment2() external {
        uint num;
        num = num + 1;
    }

    function increment3() external {
        uint num;
        num++;
    }

    function increment4() external {
        uint num;
        ++num;
    }
}
