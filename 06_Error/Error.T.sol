// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Error.sol";

contract ErrorTest is Test {
    Error public errorContrat;

    function setUp() public {
        errorContrat = new Error();
    }

    function testErrorRevert() public {
        errorContrat.errorRevert();
    }

    function testErrorRequire() public {
        errorContrat.errorRequire();
    }

    function testErrorAssert() public {
        errorContrat.errorAssert();
    }
}
