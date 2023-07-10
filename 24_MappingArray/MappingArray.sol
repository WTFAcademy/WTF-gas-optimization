// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract UseMapping {
    mapping(uint => uint) public data;

    // 22,385 gas
    function insert(uint key, uint value) public {
        data[key] = value;
    }

    // 305 gas
    function remove(uint key) public {
        delete data[key];
    }

    // 451 gas
    function get(uint key) public view returns (uint) {
        return data[key];
    }
}

contract UseArray {
    uint[] public data;

    // 44,442 gas
    function insert(uint value) public {
        data.push(value);
    }

    // 748 gas
    function remove(uint index) public {
        require(index < data.length, "Index out of bounds");

        for (uint i = index; i < data.length - 1; i++) {
            data[i] = data[i + 1];
        }

        data.pop();
    }

    // 710 gas
    function get(uint index) public view returns (uint) {
        require(index < data.length, "Index out of bounds");
        return data[index];
    }
}
