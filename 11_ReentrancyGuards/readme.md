# 11 使用更好的重入保护

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 11_ReentrancyGuards/ReentrancyGuards.T.sol --gas-report
```

## 功能简述

利用modifier 来验证合约的重入调用。设置一个Bool变量，每次调用的时候都验证当前是否为锁定状态。只有未锁定时，才会执行函数调用，函数结束时再次恢复锁的状态。虽然代码不多，但是非常精妙。同样，我们也可以用Uint变量来解决重入调用。

## DemoCode

下面分别用Bool和Uint(storage变量使用默认值0和非0初始化)两种形式解决重入调用，来观察其 gas 差异。

```solidity
contract ReentrancyGuardsBool{
    bool private locked  = false;
    modifier nonReentrant(){
        require(locked == false,"REENTRANCY");
        locked = true;
        _;
        locked = false;
    }
}

contract ReentrancyGuardsUint01{
    uint256 private locked = 0;
    modifier nonReentrant(){
        require(locked == 0,"REENTRANCY");
        locked = 1;
        _;
        locked = 0;
    }
}

contract ReentrancyGuardsUint12{
    uint256 private locked = 1;
    modifier nonReentrant(){
        require(locked == 1,"REENTRANCY");
        locked = 2;
        _;
        locked = 1;
    }
}

```

以下是测试后的情况说明，gas 优化建议如下：

因为部署产生的gas是一次性的，开发者一般会关注日常交易产生的gas，所以需要在不考虑部署gas的情况下分开说明：
1. 使用Bool：EVM将布尔值存储为uint8类型，占用两个字节，因此访问该值实际上更昂贵。这是因为EVM单词长度为32字节，所以需要额外的逻辑来告诉虚拟机解析小于标准大小的值；
2. 使用Uint01：在每次调用时将 0 更改到非 0 时会产生 ≈ 20k的gas；
3. 使用Uint12：在每次调用时将非 0 值更改为非 0 值时，只会产生2900的gas。

因为一般重入保护函数是会被多次调用的，所以建议使用Uint12这种方式。

| 重入保护 | gas 消耗  | 节省        | 结果    |
| -------- | -------- | ----------- | ------- |
| Bool     | 69395    |             |         |
| Uint01   | 69354    |             |         |
| Uint12   | 89259    |             | ✅ 建议 |

参考资料：
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.2/contracts/security/ReentrancyGuard.sol
https://github.com/wolflo/evm-opcodes/blob/main/gas.md#a7-sstore
https://medium.com/@kalexotsu/solidity-gas-optimization-stop-using-bools-for-true-false-values-e3a3d513f7fa