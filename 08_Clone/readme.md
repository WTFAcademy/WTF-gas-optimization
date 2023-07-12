# 08 clone 替换 new/create2

## 运行

根据[Foundry 官方文档](https://getfoundry.sh/)配置好运行环境后，于本项目下执行下列命令，即可看到实际 gas 差异对比。

```bash
forge test --contracts 08_Clone/Clone.T.sol --gas-report
```

## 功能简述

在工厂合约当中，我们经常需要创建若干子合约，常见的方式有三种

- new，通过现有合约进行创建，需随工厂合约将子合约部署在同一合约中；
- create2，通过 creation code 进行创建，需要在子合约部署前，提前在工厂合约中存储一份 creation code；
- clone，通过对现有合约进行克隆，需要提前部署一份子合约，使用子合约的合约地址进行克隆（EIP1167 Minimal Proxy）。

## DemoCode

下面分别用三种形式来创建自合约，观察gas差异：

```solidity
// new
function newContract() external returns (address) {
    WattingDeploy metaCoin = new WattingDeploy();
    return address(metaCoin);
}

// create2
function create2Contract(uint _salt) external payable returns (address) {
    address addr;
    bytes memory bytecode = creationCode;
    assembly {
        addr := create2(0, add(bytecode, 32), mload(bytecode), _salt)
        if iszero(extcodesize(addr)) {
            revert(0, 0)
        }
    }
    return addr;
}

// clone
function createClone(address target) internal returns (address result) {
    bytes20 targetBytes = bytes20(target);
    assembly {
        let clone := mload(0x40)
        mstore(
            clone,
            0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000
        )
        mstore(add(clone, 0x14), targetBytes)
        mstore(
            add(clone, 0x28),
            0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000
        )
        result := create(0, clone, 0x37)
    }
}
```

以下是经过三种方式进行合约创建后的 gas 情况，优化建议如下：

使用 new 操作符在提供便利的同时，会将子合约的大小塞入到工厂合约中，极易容易出现合约大小超过 24k 的情况。对比 create2 和 clone，更推荐使用 clone 来进行 gas 优化，节省创建时所耗费的 gas。

| 数据类型 | gas 消耗 | 节省        | 结果    |
| -------- | -------- | ----------- | ------- |
| clone   | 41493    | 38022(≈48%) | ✅ 建议 |
| create2  | 93031    |             |         |
| new      | 79515    |             |         |
