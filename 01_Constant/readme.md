# 01 constant、immutable、常量

## 运行

根据[Foundry官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际gas差异对比。

````bash
forge test --contracts 01_Constant/Constant.t.sol --gas-report 
````

----

## 功能简述

1. constant：定义一个常量，需要在部署时进行赋值，且后期不可变更。

2. immutable：定义一个常量，可以在部署时和constructor中进行赋值，且后期不可变更。

3. 常量：定义一个常量，可以在任意环节进行赋值，且后期可以变更。

## DemoCode

下面以3种不同的修饰符定义了3个变量。

````solidity
contract Constant {
    uint256 public constant varConstant = 1000;
    uint public immutable varImmutable = 1000;
    uint public variable = 1000;
}
````

以下是3种情况下，读取变量消耗的gas差异对比。gas优化建议如下：

1. 结合实际情况，应尽量避免使用variable对变量进行定义；

2. 对于无需修改的常量，建议使用immutable进行定义，其在功能性和gas上均为最佳。

| 关键字    | gas消耗 | 结果  |
|-----------|---------|-------|
| constant  | 183     |       |
| immutable | 161     | ✅最佳 |
| variable  | 2305    |       |