# 05 uint

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 05_uint/Uint.T.sol --gas-report
```

## 功能简述

我们知道，在 solidity 当中 uin 有很多种类，包括有 uin8、uint16、uint32、uint64、uint128、uint256，是不是位数越小，越节省 gas 呢？其实不是这样的。

以太坊虚拟机对于每一个存储的插槽都有 256 位，假设我们定义的是 uint8 类型，其实 EVM 会以补 0 的形式填充缺少的位数，转换成单个插槽进行存储。另外 EVM 在实际运行中，也会先将 uintN 转化 uint256 进行运算。

## DemoCode

下面分别用 `uin8`, `uint32`, `uint256` 进行测试，来检测其读取和写入的情况。使用不同的合约是为了排除 selector 顺序对gas的影响。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Uint8Test {
    uint8 public Uint8;

    function setUint8() external {
        Uint8 = 1;
    }
}

contract Uint32Test {
    uint32 public Uint32;

    function setUint32() external {
        Uint32 = 1;
    }
}

contract Uint256Test {
    uint256 public Uint256;
    function setUint256() external {
        Uint256 = 1;
    }
}
```

以下是经过测试得到的读取和写入的gas报告

| 读取关键字 | gas 消耗 | 节省     | 结果    |
| ---------- | -------- | -------- | ------- |
| uint8      | 2301     |          |         |
| uint32     | 2301     |          |         |
| uint256    | 2261     | 40(≈2%) | ✅ 建议 |

| 写入关键字 | gas 消耗 | 节省     | 结果    |
| ---------- | -------- | -------- | ------- |
| uint8      | 22234     |   4 (≈0.02%)      |         |
| uint32     | 22234     |   4  (≈0.02%)     |         |
| uint256    | 22238     |    |  |


我们可以看到，读取 `uint256` 比 `uint8` 和 `uint32` 便宜了 40 gas，而写入时贵了 4 gas。因此 `uint8` 和 `uint32` 的变量不一定比 `uint256` 的变量省 gas。