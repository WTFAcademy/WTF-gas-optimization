// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract RequireString {
    uint256 balance;

    // good: gas 2347
    function shortString() public view {
        require(balance > 0, "Bad Balance"); //good
    }

    // bad: gas 2578
    function longString() public view {
        require(balance > 0, "The era of digitalization has made the concept of instant gratification a norm, especially in financial transactions where the desire for seamless, effortless, and real-time processing is ever increasing. However, the swift and convenient completion of transactions is sometimes hindered by an obstacle that many of us are familiar with: insufficient account balance."); //bad
    }
}
