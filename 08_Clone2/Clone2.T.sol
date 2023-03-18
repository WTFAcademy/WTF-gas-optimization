// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Clone2.sol";

contract Clone2Test {
    WattingDeploy wattingDeploy;
    NormalFactory normalFactory;
    Clone2Factory clone2Factory;
    Create2Factory create2Factory;

    function setUp() public {
        wattingDeploy = new WattingDeploy();
        normalFactory = new NormalFactory();
        clone2Factory = new Clone2Factory();
        create2Factory = new Create2Factory();

        create2Factory.initBytecode();
    }

    function testNormalFactory() public {
        normalFactory.newContract();
    }

    function testClone2Factory() public {
        clone2Factory.clone2Contract(address(wattingDeploy));
    }

    function testCreate2Factory() public {
        create2Factory.create2Contract(1);
    }
}
