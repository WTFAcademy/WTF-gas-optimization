# 12 Less than and less than equal

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 12_LessThan/LessThan.t.sol --gas-report
```

## 功能简述
在以太坊虚拟机（EVM）中，"<" 和 ">"比"≤" 和 "≥"更加高效，因为EVM没有针对"≤" 和 "≥"的OPCODE，所以需要额外的操作码（iszero, 消耗3gas）来进行检查。


## DemoCode
下面分别通过<和<=来运行一样结果的代码,
```solidity
contract LessThan {
    function isLessThan(uint256 num) external pure returns (bool) {
        return num < 6;
    }
}

contract LessThanEqual {
    function isLessThan(uint256 num) external pure returns (bool) {
        return num <= 5;
    }
}
```
假设num为5，两个函数得出的结果都是一样的，但是使用<运算符会比<=运算符更为高效

| 运算符    | gas 消耗 | 节省                  | 结果 |
| --------- | -------- | --------------------- | ---- |
| <=  | 250      |   |   |
| < | 247      |  3  |✅ 建议
