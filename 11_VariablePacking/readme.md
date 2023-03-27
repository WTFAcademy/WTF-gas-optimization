# 11 VariablePacking

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 11_VariablePacking/VariablePacking.T.sol --gas-report
```

## 功能简述

我们知道，在Solidity合约中，是用连续32字节的插槽来储存变量的，当我们在一个插槽中放置多个变量，它被称为变量打包。


如果我们试图打包的变量超过当前槽的32字节限制，它将被存储在一个新的插槽中。我们必须找出哪些变量最适合放在一起，以最小化浪费的空间，尽管Solidity 自动尝试将小的基本类型打包到同一插槽中，但是糟糕的结构体成员排序可能会阻止编译器执行此操作。


## DemoCode

下面分别用两个变量打包顺序不一样的结构体进行测试，观察gas差异。

```solidity
contract VariablePacking {

   struct BadVariablePacking{
    uint128 x;
    uint256 y;
    uint128 z;
   }

   struct GoodVariablePacking{
    uint128 x;
    uint128 y;
    uint256 z;
   }

   BadVariablePacking  public bad;
   GoodVariablePacking  public good;

   function doBad() public {
       bad = BadVariablePacking(1,2,3);
    }

   function doGood() public {
        good = GoodVariablePacking(1,2,3);
    }

}
```

以下是 2 种情况下消耗的 gas 差异对比。gas 优化建议如下：

1. 在选择数据类型时，留心变量打包，如果刚好可以与其他变量打包放入一个储存插槽中，那么使用一个小数据类型是不错的。如果uint128不能被打包，那么选择uint256；

| 变量打包顺序 | gas 消耗 | 节省     | 结果    |
| ---------- | -------- | ---------- | ------- |
| uint128    |  66579   | 22182(≈92%)|         |
| uint256    |          |            |         |
| uint128    |          |            |         |
| ---------- | -------- | ---------- | ------- |
| uint128    |  44397   |            | ✅ 建议 |
| uint128    |          |            |         |
| uint256    |          |            |         |
