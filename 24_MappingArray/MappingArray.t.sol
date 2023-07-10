// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./MappingArray.sol";

contract Bytes32StringTest is Test {
    UseMapping public useMap;
    UseArray public useArr;
    
    function setUp() public {
        useMap = new UseMapping();
        useArr = new UseArray();
    }

    function testUseMapping() public {
        useMap.insert(0, 1);
        useMap.get(0);
        useMap.remove(0);
    }

    function testUseArray() public {
        useArr.insert(1);
        useArr.get(0);
        useArr.remove(0);
    }
}
