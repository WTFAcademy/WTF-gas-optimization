// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import {Error} from "./Error.sol";

contract ErrorTest is Test {
    Error public errorContrat;

    function setUp() public {
        errorContrat = new Error();
    }

    function testErrorRevert() public {
        vm.expectRevert(Error.NotOwner.selector);
        errorContrat.errorRevert();
    }

    function testErrorRequire() public {
        vm.expectRevert("NotOwner");
        errorContrat.errorRequire();
    }

    function testErrorAssert() public {
        vm.expectRevert();
        errorContrat.errorAssert();
    }
}
