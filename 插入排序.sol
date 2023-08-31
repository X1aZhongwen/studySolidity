// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;
import "./Strings.sol";
contract charupaixv{
    function insertionSort(uint[] memory a) public pure returns(uint[] memory) {
        // note that uint can not take negative values
        // [3,5,9,4,1]
        for (uint i = 1;i < a.length;i++){
            uint temp = a[i];
            uint j=i;
            while( (j >= 1) && (temp < a[j-1])){
                a[j] = a[j-1];
                j--;
            }
            a[j] = temp;
        }
        return(a);
    }
    /*
    指令using A for B;可用于附加库函数（从库 A）到任何类型（B）。
    添加完指令后，库A中的函数会自动添加为B类型变量的成员，可以直接调用。
    注意：在调用的时候，这个变量会被当作第一个参数传递给函数：
    */
        // 利用using for指令
    using Strings for uint256;
    function getString1(uint256 _number) public pure returns(string memory){
        // 库函数会自动添加为uint256型变量的成员
        return _number.toHexString();
    }
        // 直接通过库合约名调用
    function getString2(uint256 _number) public pure returns(string memory){
        return Strings.toHexString(_number);
    }

}