// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Bitmap {
    bool[8] implementationWithBool;
    uint8 implementationWithBitmap;

    // Use bool array: 35729
    function setDataWithBoolArray(bool[8] memory data) external {
        implementationWithBool = data;
    }

    // use Bitmap: 22366 gas
    function setDataWithBitmap(uint8 data) external {
        implementationWithBitmap = data;
    }
    
    function readWithBoolArray(uint8 index) external returns (bool) {
        return implementationWithBool[index];
    }

    function readWithBitmap(uint indexFromRight) external returns (bool) {
        uint256 bitAtIndex = implementationWithBitmap & (1 << indexFromRight);
        return bitAtIndex > 0;
    }
}
