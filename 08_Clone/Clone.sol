// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CloneTool {
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

    function isClone(
        address target,
        address query
    ) internal view returns (bool result) {
        bytes20 targetBytes = bytes20(target);
        assembly {
            let clone := mload(0x40)
            mstore(
                clone,
                0x363d3d373d3d3d363d7300000000000000000000000000000000000000000000
            )
            mstore(add(clone, 0xa), targetBytes)
            mstore(
                add(clone, 0x1e),
                0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000
            )

            let other := add(clone, 0x40)
            extcodecopy(query, other, 0, 0x2d)
            result := and(
                eq(mload(clone), mload(other)),
                eq(mload(add(clone, 0xd)), mload(add(other, 0xd)))
            )
        }
    }
}

contract WattingDeploy {
    uint256 public a = 100;
}

contract NormalFactory {
    // 79,515 gas
    function newContract() external returns (address) {
        WattingDeploy metaCoin = new WattingDeploy();
        return address(metaCoin);
    }
}

contract CloneFactory is CloneTool {
    // 41,493 gas
    function cloneContract(address libraryAddress) external returns (address) {
        address metaCoin = createClone(libraryAddress);
        return metaCoin;
    }
}

contract Create2Factory {
    bytes creationCode;

    function initBytecode() external {
        creationCode = type(WattingDeploy).creationCode;
    }

    // 93,031 gas
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
}
