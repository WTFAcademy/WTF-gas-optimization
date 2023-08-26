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

下面分别用 `uin8`, `uint32`, `uint256` 进行测试，来检测其读取，写入，和循环计算的情况。使用不同的合约排除了selector顺序对gas的影响。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Uint8Test {
    uint8 public Uint8;

    // gas 22234
    function setUint8() external {
        Uint8 = 1;
    }

    // gas 53427
    function useUint8() external returns (uint8) {
        uint8 selectedRange = 50;
        for (uint8 i=0; i < selectedRange; i++) {
            Uint8 += 1;
        }
        return Uint8;
    }
}

contract Uint32Test {
    uint32 public Uint32;

    // gas 22234
    function setUint32() external {
        Uint32 = 1;
    }

    // gas 53895
    function useUint32() external returns (uint32) {
        uint32 selectedRange = 50;
        for (uint32 i=0; i < selectedRange; i++) {
            Uint32 += 1;
        }
        return Uint32;
    }
}

contract Uint256Test {
    uint256 public Uint256;
    // gas 22238
    function setUint256() external {
        Uint256 = 1;
    }

    // gas 42950
    function useUint256() external returns (uint) {
        uint selectedRange = 50;
        for (uint i=0; i < selectedRange; i++) {
            Uint256 += 1;
        }
        return Uint256;
    }
}
```

以下是经过测试得到的读取和写入的gas报告

1. 读取数据

| 读取 | gas 消耗 | 节省     | 结果    |
| ---------- | -------- | -------- | ------- |
| uint8      | 2,301     |          |         |
| uint32     | 2,301     |          |         |
| uint256    | 2,261     | 40(≈2%) | ✅ 建议 |

2. 写入数据

| 写入 | gas 消耗 | 节省     | 结果    |
| ---------- | -------- | -------- | ------- |
| uint8      | 22,234     |   4 (≈0.02%)      |         |
| uint32     | 22,234     |   4  (≈0.02%)     |         |
| uint256    | 22,238     |    |  |

3. 循环计算

| Use | gas 消耗 | 节省     | 结果    |
| ---------- | -------- | -------- | ------- |
| uint8      | 53,427     |        |         |
| uint32     | 53,895     |       |         |
| uint256    | 42,950     |  10,945  (≈25%)   | ✅ 建议 |

我们可以看到，读取 `uint256` 比 `uint8` 和 `uint32` 便宜了 40 gas，写入时贵了 4 gas，但在循环计算中， `uint256` 要省 10,000+ gas。因此，越小的变量不一定越省gas，如果不能几个变量pack在一起的话，使用`uint`/`uint256`是最佳选择。