# 06 Error

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 06_Error/Error.T.sol --gas-report
```

## 功能简述

在 solidity 中，开发者定义的错误主要有三种形式，分别是 revert, require, assert，从功能性方面来看，主要差别在两点。

1. 是否能够抛出开发者自定义错误原因；
2. 是否能够抛出开发者自定义错误携带变量；

主要差距如下：

| 类型    | 自定义原因 | 携带变量 | 示例                                                         |
| ------- | ---------- | -------- | ------------------------------------------------------------ |
| revert  | ✅         | ✅       | Reason: NotOwner(0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84) |
| require | ✅         | ❌       | Reason: NotOwner                                             |
| assert  | ❌         | ❌       | Reason: Assertion violated                                   |

## DemoCode

下面分别用三种报错形式来运行，观测其 gas 差异变化

```solidity
contract Error {
    error NotOwner();

    function errorRevert() external pure {
        if (true) revert NotOwner();
    }

    function errorRequire() external pure {
        require(false, "NotOwner");
    }

    function errorAssert() external pure {
        assert(false);
    }
}
```

以下是经过测试得到的三种情况。gas 优化建议如下：

1. revert 兼顾既可以抛出错误信息又可以抛出相关变量两种优点，优先推荐使用；
2. require 中的字符串会存储在链上，一方面会消耗更多的 gas，一方面会让合约体积更大，建议结合实际需求选用。
3. 如有使用 assert 的场景，建议用 revert 进行平替。

| 报错类型 | gas 消耗 | 节省      | 结果    |
| -------- | -------- | --------- | ------- |
| Assert   | 180      |           |         |
| Require  | 268      |           |         |
| Revert   | 164      | 104(≈39%) | ✅ 建议 |
