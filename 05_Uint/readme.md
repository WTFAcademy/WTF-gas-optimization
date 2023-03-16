# 04 uint

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 05_uint/Uint.T.sol --gas-report
```

## 功能简述

我们知道，在 solidity 当中 uin 有很多种类，包括有 uin8、uint16、uint32、uint64、uint128、uint256，是不是位数越小，越节省 gas 呢？其实不是这样的。

以太坊虚拟机对于每一个存储的插槽都有 256 位，假设我们定义的是 uint8 类型，其实 EVM 会以补 0 的形式填充缺少的位数，转换成单个插槽进行存储。另外 EVM 在实际运行中，也会先将 uintN 转化 uint256 进行运算。

## DemoCode

下面分别用 uin8~256 进行测试，来检测其读取和写入的情况。

```solidity
contract Uint {
    uint8 public a = 10;
    uint16 public b = 10;
    uint32 public c = 10;
    uint64 public d = 10;
    uint128 public e = 10;
    uint256 public f = 10;

    function setA(uint8 a_) external {
        a = a_;
    }

    function setB(uint16 b_) external {
        b = b_;
    }

    function setC(uint32 c_) external {
        c = c_;
    }

    function setD(uint64 d_) external {
        d = d_;
    }

    function setE(uint128 e_) external {
        e = e_;
    }

    function setF(uint256 f_) external {
        f = f_;
    }
}
```

以下是经过测试得到的两种情况。gas 优化建议如下：

1. 读取和写入，都可以优先使用 uint256

| 读取关键字 | gas 消耗 | 节省     | 结果    |
| ---------- | -------- | -------- | ------- |
| uint8      | 2303     |          |         |
| uint16     | 2413     |          |         |
| uint32     | 2390     |          |         |
| uint64     | 2330     |          |         |
| uint128    | 2464     |          |         |
| uint256    | 2318     | 146(≈6%) | ✅ 建议 |

| 读取关键字 | gas 消耗 | 节省     | 结果    |
| ---------- | -------- | -------- | ------- |
| uint8      | 5310     |          |         |
| uint16     | 5387     |          |         |
| uint32     | 5366     |          |         |
| uint64     | 5350     |          |         |
| uint128    | 5446     |          |         |
| uint256    | 5256     | 190(≈4%) | ✅ 建议 |
