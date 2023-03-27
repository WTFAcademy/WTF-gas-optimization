// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract VariablePacking {

   struct BadVariablePacking{
    uint128 x;
    uint256 y;
    uint128 z;
   }

   struct GoodVariablePacking{
    uint128 x;
    uint128 y;
    uint256 z;
   }

   BadVariablePacking  public bad;
   GoodVariablePacking  public good;

   function doBad() public {
       bad = BadVariablePacking(1,2,3);
    }

   function doGood() public {
        good = GoodVariablePacking(1,2,3);
    }

}
