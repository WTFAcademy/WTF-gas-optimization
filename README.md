# WTF Gas Optimization

Solidity gas optimization techniques, verified with Foundry. 

总结 Solidity 智能合约省 gas 技巧，并使用 Foundry 验证。

Lead by [@0xKaso](https://github.com/0xKaso)

## Outline

[1. use constant and immutable](#1-use-constant-and-immutable)

[2. use calldata over memory](#2-use-calldata-over-memory)

[3. use Bitmap](#3-use-bitmap)

[4. use unchecked](#4-use-unchecked)

[5. use uint256 over uint8](#5-use-uint256-over-uint8)

[6. use custom error over require/assert](#6-use-custom-error-over-requireassert)

[7. use local variable over storage](#7-use-local-variable-over-storage)

[8. use clone over new/create2 to deploy contracts](#8-use-clone-over-newcreate2-to-deploy-contract)

[9. packing storage slots](#9-packing-storage-slots)

[10. use ++i as better increment](#10-use-i-as-better-increment)

[11. use uint in reentrancy guard](#11-use-uint-in-reentrancy-guard)

[12. use < over <=](#12-use--over)

[13. optimized selector/method id](#13-optimized-selector)

[14. selector/method-id order matters](#14-selector-order)

[15. use shorter string in require()](#15-shorter-string-in-require)

[16. use short circuit in logic operation `||` or `&&`](#16-short-circuit-in-logic-operation)

[17. delete variables to get gas refund](#17-delete-variables-to-get-gas-refund)

[18. do not initialize state variables with default values](#18-do-not-initialize-state-variables-with-default-values)

[19. swap 2 variables in 1 line with destructuring assignment](#19-swap-2-variables-in-1-line-with-destructuring-assignment)

[20. set constructor to payable to save gas](#20-set-constructor-to-payable-to-save-gas)

[21. use bytes32 for short string](#21-use-bytes32-for-short-string)

[22. use fixed-size array over dynamic array](#22-use-fixed-size-array-over-dynamic-array)

[23. use event to store data when possible](#23-use-event-to-store-data-when-possible)

[24. use `mapping` over `array` when possible](#24-use-mapping-over-array-when-possible)

## 1. use constant and immutable

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/01_Constant/Constant.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/01_Constant/readme.md)

**Testing**

```
forge test --contracts 01_Constant/Constant.t.sol --gas-report
```

**Gas report**

| Function Name    | Gas Cost |
| ---------------- | -------- |
| varConstant      | 161 ✅ |
| **varImmutable** | 161 ✅   |
| variable         | 2261  |

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
forge test --contracts 05_Uint/Uint.T.sol --gas-report
```

**Gas report**

| Function Name    | Gas Cost |
| ---------------- | -------- |
| read Uint8       | 2301     |
| read Uint32     | 2301     |
| **read Uint256** | 2261 ✅  |
| set Uint8        | 22234     |
| set Uint128      | 22234     |
| **set Uint256**  | 22238  |
| UseUint8      | 53,427     | 
| UseUint32     | 53,895     | 
| **UseUint256**    | 42,950 ✅   |

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

## 8. use clone over new/create2 to deploy contract

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/08_Clone/Clone.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/08_Clone/readme.md)

**Testing**

```bash
forge test --contracts 08_Clone/Clone.T.sol --gas-report
```

**Gas report**

| Create Type | Gas Cost |
| ----------- | -------- |
| **clone**  | 41493 ✅ |
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

**Gas report**

| Increment | Gas Cost |
| --------- | -------- |
| i += 1    | 204      |
| i = i +1  | 204      |
| i++       | 198      |
| ++i       | 193 ✅   |

## 11. use Uint in Reentrancy Guard

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/11_ReentrancyGuard/ReentrancyGuard.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/11_ReentrancyGuard/readme.md)

**Testing**

```bash
forge test --contracts 11_ReentrancyGuard/ReentrancyGuard.T.sol --gas-report
```

**Gas report**

| ReentrancyGuard  | Gas Cost |           tips                    |
| -----------------| -------- | ----------------------------------|
| Bool             | 27757 |                                   |
| Uint01           | 27604 | 0 to non-zero  -> 20000 gas       |
| **Uint12**       | 13908 ✅ | non-zero to non-zero  -> 2900 gas |

## 12. use < over <=

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/12_LessThan/LessThan.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/12_LessThan/readme.md)

**Testing**

```bash
forge test --contracts 12_LessThan/LessThan.t.sol --gas-report
```

**Gas report**

| Operator    | Gas Cost |
| ---------------- | -------- |
| <=      | 250   |
| <| 247  ✅  |


## 13 optimized selector
[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/13_MethodName/MethodName.sol) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/13_MethodName/readme.md)

**Testing**

```bash
forge test --contracts 13_MethodName/MethodName.t.sol --gas-report
```

**Gas report**

| Operator    | Gas Cost |
| ---------------- | -------- |
| regular selector 0xf8a8fd6d   | 5285   |
| optimized selector 0x000073eb | 5265  ✅  |

## 14 selector order
[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/14_MethodIdSort) | [文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/14_MethodIdSort/readme.md)

**Testing**

```bash
forge test --contracts 14_MethodIdSort/MethodIdSort.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| test1  0x0dbe671f | 164      |   
| test2  0x66e41cb7 | 142      |   
| test3  0x0a8e8e01 | 120      |   
| test_y2K 0x000073eb | 98 ✅    | 

## 15 shorter string in require()
[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/15_RequireString/RequireString.sol)｜[文章](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/15_RequireString)

**Testing**

```bash
forge test --contracts 15_RequireString/RequireString.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| longString | 2578      |   
| shortString  | 2347 ✅    |   

## 16. short circuit in logic operation

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/16_ShortCircuit)

**Testing**

```bash
forge test --contracts 16_ShortCircuit/ShortCircuit.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| normal | 191,282      |   
| shortCircuit  | 120 ✅    |   

## 17. delete variables to get gas refund

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/17_DeleteVar)

**Testing**

```bash
forge test --contracts 17_DeleteVar/DeleteVar.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| update | 22,238      |   
| updateDefault  | 2360 ✅    |   
| updateDelete  | 2316 ✅    |   

## 18. do not initialize state variables with default values

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/18_InitDefault)

**Testing**

```bash
forge test --contracts 18_InitDefault/InitDefault.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| testDefault | 67,148 ✅    |   
| testInitDefault  | 69,376     |   


## 19. swap 2 variables in 1 line with destructuring assignment

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/19_SwapVars)

**Testing**

```bash
forge test --contracts 19_SwapVars/SwapVars.t.sol --gas-report
```

**Gas report**

**This technique will not save gas, but it makes your code look better :p**

| Operator  | Gas Cost |
| -------- | -------- |
| swap | 282    |   
| desSwap  | 282 ✅    |   

## 20. set constructor to payable to save gas

You can cut out 10 opcodes in the creation-time EVM bytecode if you declare a constructor payable. The following opcodes are cut out:

- `CALLVALUE`
- `DUP1`
- `ISZERO`
- `PUSH2`
- `JUMPI`
- `PUSH1`
- `DUP1`
- `REVERT`
- `JUMPDEST`
- `POP`

In Solidity, this chunk of assembly would mean the following:

```solidity
if(msg.value != 0) revert();
```

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/20_PayableConstructor)

**Testing**

```bash
forge test --contracts 20_PayableConstructor/PayableConstructor.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| default | 67,171    |   
| payable constructor  | 67,102 ✅    |   

## 21. use bytes32 for short string

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/21_Bytes32String)

**Testing**

```bash
forge test --contracts 21_Bytes32String/Bytes32String.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| setBytes32 | 22,222 ✅    |   
| setString  | 22,682    |   

## 22. use fixed-size array over dynamic array

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/22_FixedSize)

**Testing**

```bash
forge test --contracts 22_FixedSize/FixedSize.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| set dynamic-length array | 2,224,770   |   
| set fixed-length array  | 2,182,608 ✅  |   

## 23. use `event` to store data when possible

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/23_Event)

**Testing**

```bash
forge test --contracts 23_Event/Event.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| useVar | 22,216     |   
| useEvent  | 1,189  ✅  |   

## 24. use `mapping` over `array` when possible

[Code](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/24_MappingArray)

**Testing**

```bash
forge test --contracts 24_MappingArray/MappingArray.t.sol --gas-report
```

**Gas report**

| Operator  | Gas Cost |
| -------- | -------- |
| Mapping get | 451 ✅     |   
| Mapping insert | 22,385 ✅     |   
| Mapping remove | 305 ✅     |   
| Array get | 710      |   
| Array insert | 44,442      |   
| Array remove | 748      |   


## WTF Gas Optimization 贡献者

<div align="center">
  <h4 align="center">
    贡献者是WTF学院的基石
  </h4>
<a href="https://github.com/WTFAcademy/WTF-gas-optimization/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=WTFAcademy/WTF-gas-optimization" />
</a>
</div>

## Reference

1. [Solidity-Gas-Optimization-Tips](https://github.com/devanshbatham/Solidity-Gas-Optimization-Tips)
