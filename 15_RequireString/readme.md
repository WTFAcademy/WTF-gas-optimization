# 15. RequireString

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 15_RequireString/RequireString.t.sol --gas-report
```

## 功能简述
在solidity中，`require()`中的错误信息会影响会存储在链上，影响交易成本，较短的错误信息会消耗较少的Gas，因为它们占用的字节更少。

通过精简错误信息，可以在智能合约的操作中节省Gas成本。

## DemoCode
下面示例中，调用 `shortString` 函数比调用 `longString` 函数每次节省 `231` gas

```solidity
contract RequireString {
    uint256 balance;

    // good: gas 2347
    function shortString() public view {
        require(balance > 0, "Bad Balance"); //good
    }

    // bad: gas 2578
    function longString() public view {
        require(balance > 0, "The era of digitalization has made the concept of instant gratification a norm, especially in financial transactions where the desire for seamless, effortless, and real-time processing is ever increasing. However, the swift and convenient completion of transactions is sometimes hindered by an obstacle that many of us are familiar with: insufficient account balance."); //bad
    }
}

```
| 数据类型    | gas 消耗 | 节省          | 结果    |
| ----------- | -------- | ------------- | ------- |
| longString  | 2578 |  | |
| shortString | 2347  |    231           |    ✅ 建议     |

