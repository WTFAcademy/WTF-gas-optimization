# 02 calldata、memory 引用类型修饰符

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 02_calldataAndMemory/CalldataAndMemory.T.sol --gas-report
```

## 功能简述

1. memory：函数里的参数和临时变量一般用 memory，存储在内存中，不上链。

2. calldata：和 memory 类似，存储在内存中，不上链。与 memory 的不同点在于 calldata 变量不能修改（immutable），一般用于函数的参数。

## DemoCode

下面分别用 calldata 和 memory 来写入相同的数据。

```solidity
contract CalldataAndMemory {
    struct Person {
        uint16 age;
        string name;
        string wish;
    }

    Person xiaoming;
    Person xiaoming2;

    function writeByCalldata(Person calldata xiaoming_) external {
        xiaoming = xiaoming_;
    }

    function writeByMemory(Person memory xiaoming2_) external {
        xiaoming2 = xiaoming2_;
    }
}
```

以下是 2 种情况下，写入变量消耗的 gas 差异对比。gas 优化建议如下：

1. 结合实际情况下，建议优先使用 calldata 进行变量写入。

| 关键字   | gas 消耗 | 节省     | 结果    |
| -------- | -------- | -------- | ------- |
| calldata | 67905    | 551(≈1%) | ✅ 建议 |
| memory   | 68456    |          |         |
