# 16 MethodIdSort

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 16_MethodIdSort/MethodIdSort.t.sol --gas-report
```

## 功能简述
1. 合约内所有函数是一个数组，该数组通过MethoId排序
2. 调用合约函数时，会先遍历函数数组，通过MethoId读取和执行对应函数
3. 每次遍历对比需要消耗 22 gas

## DemoCode
1. 示例中调用 test_y2k 函数比调用 test1 函数每次节省 66 gas
2. 假设 test1 为最常调用函数，优化为 test_y2k，使其 MethodId 排在数组第0个位置，节省对比成本

```solidity
contract MethodIdSort {
    function test1() external {
    }

    function test2() external {
    }

    function test3() external {
    }

    function test_y2K() external {
    }
}
```
| 函数名    | MethodId | gas 消耗 | 对比前者      | 结果 |
| -------- | -------- | -------- | -------- | -------- |
| test1  | 0x0dbe671f | 164      |   |   |
| test2  | 0x66e41cb7 | 142      |   -22  |
| test3  | 0x0a8e8e01 | 120      |   -22   |
| test_y2K | 0x000073eb | 98     |  -22  |✅ 建议