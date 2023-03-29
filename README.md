# WTF Gas Optimization

Solidity gas optimization techniques, using Foundry. 总结写 Solidity 智能合约更省 gas 的技巧。

## 大纲

[1. use constant and immutable](#1-use-constant-and-immutable)

[2. use calldata over memory](#2-use-calldata-over-memory)

[3. use Bitmap](#3-use-bitmap)

[4. use unchecked](#4-use-unchecked)

[5. use uint256 over uint8](#5-use-uint256-over-uint8)

[6. use custom error over require/assert](#6-use-custom-error-over-requireassert)

[7. use local variable over storage](#7-use-local-variable-over-storage)

[8. use clone2 over new/create2](#8-use-clone2-over-newcreate2)

[9. packing storage slots](#9-packing-storage-slots)

[10. use ++i as better increment](#10-use-i-as-better-increment)

## 1. use constant and immutable

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/01_Constant/Constant.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/01_Constant/readme.md)

**Testing**

```
forge test --contracts 01_Constant/Constant.t.sol --gas-report
```

**Gas report**

| Function Name    | Gas Cost |
| ---------------- | -------- |
| varConstant      | 183      |
| **varImmutable** | 161 ✅   |
| variable         | 2305     |

## 2. use calldata over memory

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/02_CalldataAndMemory/CalldataAndMemory.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/tree/main/02_CalldataAndMemory/readme.md)

**Testing**

```
forge test --contracts 02_CalldataAndMemory/CalldataAndMemory.T.sol --gas-report
```

**Gas report**

| Function Name       | Gas Cost |
| ------------------- | -------- |
| **writeByCalldata** | 67905 ✅ |
| writeByMemory       | 68456    |

## 3. use Bitmap

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/03_Bitmap/Bitmap.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/03_Bitmap/readme.md)

**Testing**

```
forge test --contracts 03_Bitmap/Bitmap.T.sol --gas-report
```

**Gas report**

| Function Name         | Gas Cost |
| --------------------- | -------- |
| **setDataWithBitmap** | 22366 ✅ |
| setDataWithBoolArray  | 35729    |

## 4. use unchecked

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/04_Unchecked/Unchecked.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/04_Unchecked/readme.md)

**Testing**

```
forge test --contracts 04_unchecked/Unchecked.T.sol --gas-report
```

**Gas report**

| Function Name    | Gas Cost  |
| ---------------- | --------- |
| forNormal        | 1910309   |
| **forUnckecked** | 570287 ✅ |

## 5. use uint256 over uint8

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/05_Uint/Uint.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/05_Uint/readme.md)

**Testing**

```
forge test --contracts 05_uint/Uint.T.sol --gas-report
```

**Gas report**

| Function Name    | Gas Cost |
| ---------------- | -------- |
| read Uint8       | 2379     |
| read Uint128     | 2465     |
| **read Uint256** | 2317 ✅  |
| set Uint8        | 5355     |
| set Uint128      | 5358     |
| **set Uint256**  | 5322 ✅  |

## 6. use custom error over require/assert

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/06_Error/Error.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/06_Error/readme.md)

**Testing**

```
forge test --contracts 06_Error/Error.T.sol --gas-report
```

**Gas report**

| Error Name | Gas Cost |
| ---------- | -------- |
| Assert     | 180      |
| Require    | 268      |
| **Revert** | 164 ✅   |

## 7. use local variable over storage

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/07_LocalData/LocalData.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/07_LocalData/readme.md)

**Testing**

```bash
forge test --contracts 07_LocalData/LocalData.T.sol --gas-report
```

**Gas report**

| Data Type     | Gas Cost   |
| ------------- | ---------- |
| **localData** | 1902339 ✅ |
| storageData   | 4022155    |

## 8. use clone2 over new/create2

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/08_Clone2/Clone2.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/08_Clone2/readme.md)

**Testing**

```bash
forge test --contracts 08_Clone2/Clone2.T.sol --gas-report
```

**Gas report**

| Create Type | Gas Cost |
| ----------- | -------- |
| **clone2**  | 41493 ✅ |
| create2     | 93031    |
| new         | 79515    |

## 9. packing storage slots

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/09_Packing/Packing.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/09_Packing/readme.md)

**Testing**

```bash
forge test --contracts 09_Packing/Packing.T.sol --gas-report
```

**Gas report**

| Create Type | Gas Cost  |
| ----------- | --------- |
| normal      | 133521    |
| **packing** | 111351 ✅ |

## 10. use ++i as better increment

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/10_Increment/Increment.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/10_Increment/readme.md)

```bash
forge test --contracts 10_Increment/Increment.T.sol --gas-report
```

| Increment | Gas Cost |
| --------- | -------- |
| i += 1    | 270      |
| i = i +1  | 248      |
| i++       | 220      |
| ++i       | 193 ✅   |

## 11. use Uint12 over Bool Uint01

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/11_ReentrancyGuards/ReentrancyGuards.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/11_ReentrancyGuards/readme.md)

**Testing**

```bash
forge test --contracts 11_ReentrancyGuards/ReentrancyGuards.T.sol --gas-report
```

**Gas report**

| ReentrancyGuards | Gas Cost |
| -----------------| -------- |
| Bool             | 69395    |
| Uint01           | 69354    |
| Uint12           | 89259 ✅ |


## WTF Gas Optimization 贡献者

<div align="center">
  <h4 align="center">
    贡献者是WTF学院的基石
  </h4>
<a href="https://github.com/WTFAcademy/WTF-gas-optimization/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=WTFAcademy/WTF-gas-optimization" />
</a>
</div>
