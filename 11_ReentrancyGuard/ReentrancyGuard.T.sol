// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./ReentrancyGuard.sol";

contract ReentrancyGuardTest is Test {

    SimpleCase simpleCase;
    address owner;

    function setUp() public {
        simpleCase = new SimpleCase();
        // generate test user
        owner = vm.addr(1);
        // add some ether
        vm.deal(owner, 2 ether);
        vm.prank(owner);
        simpleCase.deposit{value: 1 ether}();
    }

    function testDeployReentrancyGuardsBool() public {
        vm.prank(owner);
        simpleCase.withdrawBool();
    }

    function testDeployReentrancyGuardsUint01() public {
        vm.prank(owner);
        simpleCase.withdraw01();
    }

    function testDeployReentrancyGuardsUint12() public {
        vm.prank(owner);
        simpleCase.withdraw12();
    }
}

contract SimpleCase is ReentrancyGuardBool, ReentrancyGuardUint01, ReentrancyGuardUint12 {
    
    mapping(address => uint256) private balance;

    function deposit() external payable {
        balance[msg.sender] = balance[msg.sender] + msg.value;
    }

    function withdrawBool() external nonReentrantBool {
        _withdraw();
    }

    function withdraw01() external nonReentrant01 {
        _withdraw();
    }

    function withdraw12() external nonReentrant12 {
        _withdraw();
    }

    function _withdraw() private {
        uint256 amount = balance[msg.sender];
        require(amount > 0);

        balance[msg.sender] = 0;
        (bool suceess, ) = address(msg.sender).call{value: amount}("");
        require(suceess, "withdraw failed to sender");
    }
}