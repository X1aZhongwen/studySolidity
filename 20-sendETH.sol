// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract ReceiveETH {
    // 收到eth事件，记录amount和gas
    event Log(uint amount, uint gas);
    
    // receive方法，接收eth时被触发
    receive() external payable{
        emit Log(msg.value, gasleft());
    }
    
    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
}
contract SendETH {
    // 构造函数，payable使得部署的时候可以转eth进去
    constructor() payable{
    }
    // receive方法，接收eth时被触发
    receive() external payable{}
    /*
    transfer

    用法是接收方地址.transfer(发送ETH数额)。
    transfer()的gas限制是2300，足够用于转账，但对方合约的fallback()或receive()函数不能实现太复杂的逻辑。
    transfer()如果转账失败，会自动revert（回滚交易）。
    */

    function TransferETH(address payable to, uint amount) external {
        to.transfer(amount);
    }//1000000000000000000
    // send()发送ETH
    error SendFailed();
    function sendETH(address payable _to, uint256 amount) external payable{
        // 处理下send的返回值，如果失败，revert交易并发送error
        bool success = _to.send(amount); // .send()的返回值是bool
        if(!success){
            revert SendFailed();
        }
    }
    /*    用法是接收方地址.send(发送ETH数额)。
    send()的gas限制是2300，足够用于转账，但对方合约的fallback()或receive()函数不能实现太复杂的逻辑。
    send()如果转账失败，不会revert。
    send()的返回值是bool，代表着转账成功或失败，需要额外代码处理一下。*/

    /*
    call

    用法是接收方地址.call{value: 发送ETH数额}("")。
    call()没有gas限制，可以支持对方合约fallback()或receive()函数实现复杂逻辑。
    call()如果转账失败，不会revert。
    call()的返回值是(bool, data)，其中bool代表着转账成功或失败，需要额外代码处理一下。
    */
    // call()发送ETH
    error CallFailed();
    function callETH(address payable _to, uint256 amount) external payable{
        // 处理下call的返回值，如果失败，revert交易并发送error
        (bool success,) = _to.call{value: amount}("");//call()的返回值是(bool, data)
        if(!success){
           revert CallFailed();
        }
    }
}