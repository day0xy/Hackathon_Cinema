// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Cinema is Ownable {
    IERC20 public token;
    IERC721 public nft;

    struct Film {
        uint256 id;
        string name;
        uint256 price;
        uint256 award;
        uint256 awardTime;
        uint256 awardAmount;
        uint256 awardToken;
        uint256 awardNFT;
    }

    constructor(address usdt_address, address nft_address) Ownable(msg.sender) {
        token = IERC20(usdt_address);
        nft = IERC721(nft_address);
    }

    function listFilmWithAward(uint256 id) public {}
}
