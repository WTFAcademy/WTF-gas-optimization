# 07 局部变量

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 07_LocalData/LocalData.T.sol --gas-report
```

## 功能简述

在一些常见的 DeFi 项目中，我们经常会遇见各类复杂运算，其中不免需要定义很多新的局部变量，更新老的全局变量。我们知道存储的修改是非常昂贵的，而在内存中修改则要便宜很多。

## DemoCode

下面分别用两种形式来修改存储变量，观测其 gas 差异。

```solidity
contract LocalData {
    uint myCounter;

    function storageData(uint times) external {
        for (uint i; i < times; i++) {
            myCounter++;
        }
    }

    function localData(uint times) external {
        uint local_mycounter;
        for (uint i; i < times; i++) {
            local_mycounter++;
        }
        myCounter = local_mycounter;
    }
}
```

以下是经过执行 10000 次 for 循环测试得到的两种情况。gas 优化建议如下：

在较为复杂的运算当中，避免直接操作存储变量，而可以先定义一个局部变量，对局部变量进行修改后，再修改存储变量，可以有效节省 gas。

| 数据类型    | gas 消耗 | 节省          | 结果    |
| ----------- | -------- | ------------- | ------- |
| localData   | 1902339  | 2119816(≈53%) | ✅ 建议 |
| storageData | 4022155  |               |         |
