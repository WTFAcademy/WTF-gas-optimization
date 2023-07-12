// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Error {
    error NotOwner();

    // revert: 164 gas
    function errorRevert() external pure {
        if (true) revert NotOwner();
    }

    // require: 268 gas
    function errorRequire() external pure {
        require(false, "NotOwner");
    }

    // assert 180 gas
    function errorAssert() external pure {
        if (true) assert(false);
    }
}
