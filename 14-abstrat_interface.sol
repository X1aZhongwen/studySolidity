// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// abstract contract heyue{
//      function asd(uint256 age)public view virtual returns(uint256);
// }
// contract interactBAYC {
//     // 利用BAYC地址创建接口合约变量（ETH主网）
//     IERC721 BAYC = IERC721(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

//     // 通过接口调用BAYC的balanceOf()查询持仓量
//     function balanceOfBAYC(address owner) external view returns (uint256 balance){
//         return BAYC.balanceOf(owner);
//     }

//     // 通过接口调用BAYC的safeTransferFrom()安全转账
//     function safeTransferFromBAYC(address from, address to, uint256 tokenId) external{
//         BAYC.safeTransferFrom(from, to, tokenId);
//     }
// }
interface Base{
    function getFirstName()external pure returns(string memory);
    function getLastName()external pure returns(string memory);
}
contract Esab is Base{
        function getFirstName()external pure override returns(string memory){
            return "Xia";
        }
        function getLastName()external pure override returns(string memory){
            return "Zhongwen";
        }


}