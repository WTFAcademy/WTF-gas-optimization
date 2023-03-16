# WTF Gas Optimization

## 大纲

[第一讲：constant/immutable/variable](#1-contantimmutablevariable)


[第二讲：calldata/memory 引用类型修饰符](#2-calldatamemory)

[第三讲：位图与位运算符](#3-bool-arraybitmap)

[第四讲：unchecked for 循环](#4-unchecked-for-loop)

[第五讲：best uint](#5-best-uint)


## 1. contant/immutable/variable 
[代码](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/01_Constant/Constant.sol) |[文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/01_Constant/readme.md)

**Testing**

```
forge test --contracts 01_Constant/Constant.t.sol --gas-report
```

**Gas report**

| Function Name                            | Gas Cost |
| ---------------------------------- | ----- | 
| varConstant | 183  |
| **varImmutable** | 161 ✅ |
| variable      | 2305 |


## 2. calldata/memory 
[代码](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/02_calldataAndMemory/CalldataAndMemory.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/tree/main/02_calldataAndMemory/readme.md)

**Testing**

```
forge test --contracts 02_calldataAndMemory/CalldataAndMemory.T.sol --gas-report
```

**Gas report**

| Function Name                            | Gas Cost |
| ---------------------------------- | ----- | 
| **writeByCalldata** | 67905 ✅ |
| writeByMemory      | 68456 |


## 3. bool array/bitmap
[代码](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/03_Bitmap/Bitmap.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/03_Bitmap/readme.md)


**Testing**

```
forge test --contracts 03_Bitmap/Bitmap.T.sol --gas-report
```

**Gas report**

| Function Name                            | Gas Cost |
| ---------------------------------- | ----- | 
| **setDataWithBitmap** | 22366 ✅ |
| setDataWithBoolArray      | 35729 |


## 4. unchecked for loop

[代码](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/04_Unchecked/Unchecked.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/04_Unchecked/readme.md)

**Testing**

```
forge test --contracts 04_unchecked/Unchecked.T.sol --gas-report
```

**Gas report**

| Function Name                            | Gas Cost |
| ---------------------------------- | ----- | 
| forNormal | 1910309  |
| **forUnckecked**      | 570287 ✅ |

## 5. best uint

[代码](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/05_Uint/Uint.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/05_Uint/readme.md)

**Testing**

```
forge test --contracts 05_uint/Uint.T.sol --gas-report
```

**Gas report**

| Function Name                            | Gas Cost |
| ---------------------------------- | ----- | 
| read Uint8 | 2379  |
| read Uint128 | 2465  |
| **read Uint256** | 2317 ✅ |
| setUint8 | 5355  |
| setUint128 | 5358  |
| **setUint256** | 5322 ✅  |


## WTF Gas Optimization 贡献者

<div align="center">
  <h4 align="center">
    贡献者是WTF学院的基石
  </h4>
<a href="https://github.com/WTFAcademy/WTF-gas-optimization/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=WTFAcademy/WTF-gas-optimization" />
</a>
</div>
