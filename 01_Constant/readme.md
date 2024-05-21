# 01 constant、immutable、变量

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 01_Constant/Constant.t.sol --gas-report
```

## 功能简述

1. constant：声明一个常量，需要在声明时进行赋值，且后期不可变更。

2. immutable：声明一个常量，可以在声明时和 constructor 中进行赋值，且后期不可变更。

3. 变量：声明一个变量，可以在任意环节进行赋值，且后期可以变更。

## DemoCode

下面用 2 种不同的修饰符定义了 3 个变量（放在不同的合约中方便测试gas，排除[selector顺序导致的gas计算不准确](https://github.com/WTFAcademy/WTF-gas-optimization/blob/main/14_MethodIdSort/readme.md)）。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Constant {
    uint256 public constant varConstant = 1000;
}

contract Immutable {
    uint256 public immutable varImmutable = 1000;
}

contract Public {
    uint256 public variable = 1000;
}
```

以下是 3 种情况下，读取变量消耗的 gas 差异对比。gas 优化建议如下：

1. 结合实际情况，应尽量避免使用 variable 对变量进行定义；

2. 对于无需修改的常量，建议使用 immutable 进行定义，其在功能性和 gas 上均为最佳。

| 关键字    | gas 消耗 | 节省                  | 结果 |
| --------- | -------- | --------------------- | ---- |
| constant  | 161    | 2100(≈93%) ｜ ✅ 建议 |
| immutable | 161      | 2100(≈93%) ｜ ✅ 建议 |
| variable  | 2261 |                       |      |
