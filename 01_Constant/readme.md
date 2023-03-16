# 01 constant、immutable、常量

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 01_Constant/Constant.t.sol --gas-report
```

## 功能简述

1. constant：定义一个常量，需要在部署时进行赋值，且后期不可变更。

2. immutable：定义一个常量，可以在部署时和 constructor 中进行赋值，且后期不可变更。

3. 常量：定义一个常量，可以在任意环节进行赋值，且后期可以变更。

## DemoCode

下面用种不同的修饰符定义了 3 个变量。

```solidity
contract Constant {
    uint256 public constant varConstant = 1000;
    uint public immutable varImmutable = 1000;
    uint public variable = 1000;
}
```

以下是 3 种情况下，读取变量消耗的 gas 差异对比。gas 优化建议如下：

1. 结合实际情况，应尽量避免使用 variable 对变量进行定义；

2. 对于无需修改的常量，建议使用 immutable 进行定义，其在功能性和 gas 上均为最佳。

| 关键字    | gas 消耗 | 节省                  | 结果 |
| --------- | -------- | --------------------- | ---- |
| constant  | 183      | 2122(≈92%)｜ ✅ 建议  |
| immutable | 161      | 2144(≈93%) ｜ ✅ 建议 |
| variable  | 2305     |                       |      |
