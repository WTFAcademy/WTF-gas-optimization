# 13 MethodName and MethodId

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 15_MethodName/MethodName.t.sol --gas-report
```

## 功能简述
1. EVM执行交易，calldata数据消耗gas，0字节消耗 4 gas，非0字节消耗 16 gas
2. calldata前4个字节是MethodId，通过优化函数名增加MethodId中0字节的个数来节省gas
3. [在线函数名优化](https://emn178.github.io/solidity-optimize-name/)

## DemoCode
下面分别调用普通函数和MethodId优化后的函数
```solidity
contract MethodName {
    function test() external {
    }
}

contract MethodNameOpt {
    function test_y2K() external {
    }
}
```
| 函数名    | MethodId | gas 消耗 | 节省      | 结果 |
| -------- | -------- | -------- | -------- | -------- |
| test  | 0xf8a8fd6d | 5285      |   |   |
| test_y2K | 0x000073eb | 5265     |  20  |✅ 建议