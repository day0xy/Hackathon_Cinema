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

    event ListFilm(uint256 indexed _id, string memory_name, uint256 _hallId);
    event RentFilmSeat(uint256 filmId, uint256 nftId, uint256 price);

    uint256[] public filmIds; //电影id列表
    mapping(uint256 => Film) public films; //映射id到电影信息
    mapping(uint256 => NftOfSeat) public nftOfSeat; //映射nft到座位信息

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
        uint256 _hallId,
        uint256 _startTime,
        uint256 _endTime,
        uint256 _basePrice
    ) public {
        //检查电影是否已经上架
        require(!films[_id].isListed, "Film already listed");
        //将电影信息存入映射,isListed为true
        films[_id] = Film(
            _id,
            _name,
            _hallId,
            _startTime,
            _endTime,
            _basePrice,
            true
        );
        //id存入filmIds，上架这个id的序号由前端进行查询，不消耗gas
        filmIds.push(_id);
        emit ListFilm(_id, _name, _hallId);
    }

    //设置座位信息

    function rentFilmSeat(uint256 filmId, uint256 nftId) public {
        //检查电影是否上架
        require(films[filmId].isListed, "Film not listed");
        //检查座位是否已经被租赁
        require(nft.ownerOf(nftId) == address(this), "Seat already rented");
        //检查座位是否存在
        require(nftOfSeat[nftId].seatX != 0, "Seat not exist");
        //计算价格
        uint256 price = films[filmId].basePrice;
        //转账
        token.transferFrom(msg.sender, owner(), price);
        //转移nft
        nft.transferFrom(address(this), msg.sender, nftId);
        emit RentFilmSeat(filmId, nftId, price);
    }

    //查询id列表 提供给前端使用
    function getFilmIds() public view returns (uint256[] memory) {
        return filmIds;
    }
}
