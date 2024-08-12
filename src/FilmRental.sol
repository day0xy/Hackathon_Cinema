// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FilmRental is Ownable {
    IERC20 public token;
    IERC721 public nft;

    uint256[] public filmIds; //电影id列表

    //用USDT和ETH进行交易租赁

    //初始化，传入USDT地址和NFT地址
    constructor(address usdt_address, address nft_address) Ownable(msg.sender) {
        token = IERC20(usdt_address);
        nft = IERC721(nft_address);
    }

    mapping(uint256 => Film) public films; //映射id到电影信息
    mapping(uint256 => NftOfSeat) public nftOfSeat; //映射nft到座位信息

    event ListFilm(uint256 _id, string memory_name, uint256 _hallId);
    event RentFilmSeat(uint256 filmId, uint256 nftId, uint256 price);

    struct Film {
        uint256 id; //电影id
        string name; //电影名字
        uint256 hallId; //放映厅id
        uint256 startTime; //开始时间
        uint256 endTime; //结束时间
        uint256 basePrice; //基准价格
        bool isListed; //是否上架
    }

    struct NftOfSeat {
        uint256 seatX; //x轴
        uint256 seatY; //y轴
    }

    //影院在平台上架电影
    function listFilm(
        uint256 _id,
        string memory _name,
        string memory _hallId,
        uint256 _startTime,
        uint256 _endTime,
        uint256 _basePrice
    ) public {
        require(!films[_id].isListed, "Film already listed");
        films[_id] = Film(
            _id,
            _name,
            _hallId,
            _startTime,
            _endTime,
            _basePrice,
            true
        );
        filmIds.push(_id);
        emit ListFilm(_id, _name, _hallId);
    }

}
