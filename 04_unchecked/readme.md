# 04 for 循环 i++ 优化

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 04_unchecked/Unchecked.T.sol --gas-report
```

## 功能简述

我们知道在 solidity 0.8 版本之前，需要手动引入 SafeMath 库来确保数据的安全性，避免数据发生溢出，从而产生数据溢出攻击。

在 solidity 0.8 版本之后，solidity 会在每一次数据发生变更时，进行一个检查，判断是否溢出，从而决定是否抛出异常。

这样同时也因为检测带了额外的 gas 消耗，通过合理的使用 unchecked，可以有效去掉中间检测环节，从而达到 gas 节省的目的。

## DemoCode

下面分别用常规的 for 循环和 unchecked 类型的 for 循环来进行演示。注意，由于 times 已经是 uint256 类型，故此处不会出现溢出问题。

```solidity
contract Unchecked {
    function forNormal(uint256 times) external pure returns (uint256 result) {
        for (uint256 i; i < 10000; i++) {
            result = i + 1;
        }
    }

    function forUnckecked(uint256 times) external pure returns (uint256 result) {
        for (uint256 i; i < times; ) {
            unchecked {
                i++;
                result = i + 1;
            }
        }
    }
}
```

以下是 2 种情况下，执行 10000 次循环差异对比。gas 优化建议如下：

1. 在安全性可控情况下，建议优先选择 unchecked 用于 gas 优化。

| 关键字       | gas 消耗 | 节省          | 结果    |
| ------------ | -------- | ------------- | ------- |
| 无 unchecked | 570287   | 1340022(≈70%) | ✅ 建议 |
| 有 unchecked | 1910309  |               |         |
