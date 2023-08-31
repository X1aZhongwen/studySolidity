// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ConstructorsAndModifiers{
   address owner; // 定义owner变量

   // 构造函数
   constructor() {
      owner = msg.sender; // 在部署合约的时候，将owner设置为部署者的地址
   }
    // 定义modifier
   modifier onlyOwner {
      require(msg.sender == owner); // 检查调用者是否为owner地址
      _; // 如果是的话，继续运行函数主体；否则报错并revert交易
      owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
   }
    function changeOwner(address _newOwner) external onlyOwner{
      owner = _newOwner; // 只有owner地址运行这个函数，并改变owner
   }
   function returnOwner() external view returns(address){
       return owner;
   }//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
   //0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
}