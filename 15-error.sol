// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract ERROR{
    error TransferNotOwner(uint256 age); // 自定义error
    mapping(uint256 => address ) private _owners;
    function transferOwner1(uint256 tokenId, address newOwner) public {
        if(_owners[tokenId] != msg.sender){
            revert TransferNotOwner(16);
        }
        _owners[tokenId] = newOwner;
    }
    function transferOwner2(uint256 tokenId, address newOwner) public {
        require(_owners[tokenId] == msg.sender, "Transfer Not Owner");
        _owners[tokenId] = newOwner;
    }
    function transferOwner3(uint256 tokenId, address newOwner) public {
        assert(_owners[tokenId] == msg.sender);//!
        _owners[tokenId] = newOwner;
    }//gas不同
}