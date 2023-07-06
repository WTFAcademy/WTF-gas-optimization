// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "./Bitmap.sol";

contract BitmapTest is Test {
    Bitmap public bitmap;

    function setUp() public {
        bitmap = new Bitmap();
    }

    function testSetDataWithBoolArray() public {
        bitmap.setDataWithBoolArray(
            [true, true, true, true, true, true, true, true]
        );
    }

    function testSetDataWithBitmap() public {
        bitmap.setDataWithBitmap(255);
    }
}
