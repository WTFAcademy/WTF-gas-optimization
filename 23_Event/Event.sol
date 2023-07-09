// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Event {
    event Update(uint256 newBalance);
    uint balance;

    // use variable to store data: 22,216
    function useVar() external {
        balance = 1;
    }

    // use event to store data: 1,189
    function useEvent() external {
        emit Update(1);
    }
}
