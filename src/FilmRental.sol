// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FilmRental is Ownable {
    IERC20 public token;
    IERC721 public nft;

    //用USDT和ETH进行交易租赁

    //初始化，传入USDT地址和NFT地址
    constructor(address usdt_address, address nft_address) Ownable(msg.sender) {
        token = IERC20(usdt_address);
        nft = IERC721(nft_address);
    }

    //映射电影id到电影信息
    mapping(uint256 => Film) public films;

    struct Film {
        uint256 id;
        string name;
        uint256 basePrice; //基准价格
        uint256 award;
        uint256 startTime;
        uint256 endTime;
    }

    //影院在平台上架电影
    function listFilmWithAward(uint256 id) public {

    }
}
