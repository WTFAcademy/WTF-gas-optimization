# 17. DeleteVar

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 17_DeleteVar/DeleteVar.t.sol --gas-report
```

## 功能简述

在Solidity中，使用`delete`关键字删除一个状态变量会变量将其重置到变量类型的默认值，对于不同的数据类型，默认值有所不同：

对于`uint`，默认值是`0`。
对于`bool`，默认值是`false`。
对于引用类型（如数组、映射、结构体等），`delete`会移除所有元素并重置为初始状态。对于动态数组，还会将长度重置为`0`。
对于地址类型，默认值是`0x0000000000000000000000000000000000000000`。

更多内容可查看：[WTF Solidity极简入门 - 8. 变量初始值](https://github.com/AmazingAng/WTF-Solidity/tree/main/08_InitialValue)

与直接删除状态变量相比，将变量直接更新为默认值所消耗的gas会有所不同。当使用`delete`关键字删除一个状态变量时，Solidity会生成一个特定的操作码`SSTORE`来将变量的值设置为其类型的默认值。`delete`是一个高级操作，由编译器识别并优化，可以一次性清除所有相关存储，而在手动重置时可能需要更多的操作和更高的gas。

## DemoCode

下面的智能合约`DeleteVar`中定义了一个状态变量`balance`，以及两种不同删除`balance`状态变量数据的方法。每种方法的gas消耗都有所不同

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DeleteVar {
    uint balance;

    // normal update balance: 22238 gas
    function update() external {
        balance = 1;
    }

    // update and delete: 2316 gas
    function updateDelete() external {
        balance = 1;
        delete balance;
    }

    // update and assign to default value: 2360 gas
    function updateDefault() external {
        balance = 1;
        balance = 0;
    }
}
```

| 方法名称        | gas 消耗 | 节省         | 结果    |
| --------------- | -------- | ------------ | ------- |
| updateDefault   | 2360     |        |  |
| updateDelete    | 2316     | 44        | ✅ 建议 |


通过对比，我们发现使用`delete`关键字来删除变量，消耗的gas更少。