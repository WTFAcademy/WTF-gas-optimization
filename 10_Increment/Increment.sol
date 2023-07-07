// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Increment1 {
    function increment1() external pure {
        uint num;
        num += 1;
    }
}

contract Increment2 {
    function increment2() external pure {
        uint num;
        num = num + 1;
    }
}

contract Increment3 {
    function increment3() external pure {
        uint num;
        num++;
    }
}

contract Increment4 {
    function increment4() external pure {
        uint num;
        ++num;
    }
}
