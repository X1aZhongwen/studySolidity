// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract Event{
        // 定义_transfer函数，执行转账逻辑
        mapping (address => uint256) private _balances;
        event Transfer(address from,address to,uint256 amount);
    function _transfer(address from,address to,uint256 amount) external {

        _balances[from] = 10000000; // 给转账地址一些初始代币

        _balances[from] -=  amount; // from地址减去转账数量
        _balances[to] += amount; // to地址加上转账数量

        // 释放事件
        emit Transfer(from, to, amount);
    }
    // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    // 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
}