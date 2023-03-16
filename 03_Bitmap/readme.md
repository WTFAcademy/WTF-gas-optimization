# 03 位运算符

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts forge test --contracts 03_Bitmap/Bitmap.T.sol --gas-report
```

## 功能简述

我们知道在区块链上，存储是非常昂贵的，在一些前沿的项目中，会用一些 hack 的方法来降低 gas，今天讲的这种方法，就常见于一些头部项目的源码中。

如 uint8 二进制表示为 00000000，其中每一位有 0、1 两种情况，我们默认为 1 时则为 true，0 为 false，此时可以达到将 bool 值以位的形式来进行管理。

## DemoCode

下面分别用 bool 数组和 位运算 来管理相同的数据。

```solidity
contract Bitmap {
    bool[10] implementationWithBool;
    uint8 implementationWithBitmap;

    function setDataWithBoolArray(bool[8] memory data) external {
        implementationWithBool = data;
    }

    function setDataWithBitmap(uint8 data) external {
        implementationWithBitmap = data;
    }

    function readWithBoolArray(uint8 index) external returns (bool) {
        return implementationWithBool[index];
    }

    function readWithBitmap(uint indexFromRight) external returns (bool) {
        uint256 bitAtIndex = implementationWithBitmap & (1 << indexFromRight);
        return bitAtIndex > 0;
    }
}
```

以下是 2 种情况下，写入变量消耗的 gas 差异对比。gas 优化建议如下：

1. 结合实际情况下，建议优先使用 位运算符 进行部分变量管理。

| 关键字   | gas 消耗 | 节省        | 结果    |
| -------- | -------- | ----------- | ------- |
| 位运算符 | 22366    | 13363(≈37%) | ✅ 建议 |
| 普通变量 | 35729    |             |         |
