// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./LocalData.sol";

contract LocalDataTest is Test {
    LocalData public localData;

    function setUp() public {
        localData = new LocalData();
    }

    function testLocalData() public {
        localData.localData(10000);
    }

    function testStorageData() public {
        localData.storageData(10000);
    }
}
