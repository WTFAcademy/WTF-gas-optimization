# 17. DeleteVar

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 17_DeleteVar/DeleteVar.t.sol --gas-report
```

## 功能简述

在Solidity中，使用`delete`关键字删除一个状态变量会将其重置到变量类型的默认值，对于不同的数据类型，默认值有所不同：

对于`uint`，默认值是`0`。
对于`bool`，默认值是`false`。
对数组使用 `delete` 会重置其元素，动态数组的长度也会归零。删除结构体会重置其普通成员。映射不会被整体清空，结构体中的映射成员也会保留。用 `delete map[key]` 可以重置指定键对应的值。
对于地址类型，默认值是`0x0000000000000000000000000000000000000000`。

更多内容可查看：[WTF Solidity极简入门 - 8. 变量初始值](https://github.com/AmazingAng/WTF-Solidity/tree/main/08_InitialValue)

对于简单的存储槽，`delete` 和直接赋默认值都可以用 `SSTORE` 实现。实际 gas 消耗取决于编译器和存储槽的状态。清零退款还受 [EIP-3529](https://eips.ethereum.org/EIPS/eip-3529) 的限制。

## DemoCode

下面的智能合约`DeleteVar`中定义了一个状态变量`balance`，以及两种不同删除`balance`状态变量数据的方法。两种方法消耗的gas有所不同：

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


这组数字来自示例中的两次调用。比较 `delete` 和直接赋值时，应在同一编译配置下使用相同的初始存储状态。