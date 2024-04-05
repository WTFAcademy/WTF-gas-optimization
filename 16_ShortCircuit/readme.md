# 16. ShortCircuit

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 16_ShortCircuit/ShortCircuit.t.sol --gas-report
```

## 功能简述

短路是一种常用的编程技术，在Solidity中，这种技术同样适用，并且可以有效地用于节省gas。短路发生在使用逻辑`AND（&&）`和逻辑`OR（||）`操作符时。

在一个逻辑表达式中：

- 对于逻辑`AND（&&）`，如果第一个条件为`false`，则不会评估第二个条件，因为整个表达式已经确定为`false`。
- 对于逻辑`OR（||）`，如果第一个条件为`true`，则不会评估第二个条件，因为整个表达式已经确定为 `true` 。
## DemoCode
下面示例中，调用 `shortCircuit()` 函数比调用 `normal()` 函数每次节省 `123162` gas:

```solidity
contract ShortCircuit {
    function f() public pure returns (bool res) {
        uint result;
        for (uint256 i; i < 1000; i++) {
            result += 1;
        }
        res = true;
    }

    function g() public pure returns (bool res) {
        res = true;
    }

    // no short circuit: high gas 123,282 
    function normal() external pure {
        f() || g();
    }

    // lower gas: 120
    function shortCircuit() external pure {
        g() || f();
    }
}

```
| 数据类型    | gas 消耗 | 节省          | 结果    |
| ----------- | -------- | ------------- | ------- |
| normal  | 123282 |  |  |
| shortCircuit | 120  |    123162  |    ✅ 建议     |

