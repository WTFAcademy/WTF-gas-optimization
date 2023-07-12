// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Clone.sol";

contract CloneTest {
    WattingDeploy wattingDeploy;
    NormalFactory normalFactory;
    CloneFactory cloneFactory;
    Create2Factory create2Factory;

    function setUp() public {
        wattingDeploy = new WattingDeploy();
        normalFactory = new NormalFactory();
        cloneFactory = new CloneFactory();
        create2Factory = new Create2Factory();

        create2Factory.initBytecode();
    }

    function testNormalFactory() public {
        normalFactory.newContract();
    }

    function testCloneFactory() public {
        cloneFactory.cloneContract(address(wattingDeploy));
    }

    function testCreate2Factory() public {
        create2Factory.create2Contract(1);
    }
}
