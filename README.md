# 简介

为影院和租凭者提供一个平台用于租赁影院座位，在每场电影放映后

给予**售出**座位的租赁者一定USDT奖励,

如果**没售出**，提供积分，积分可以购买影院上架的部分场次电影的电影票



usdt奖励额度由影院自行设置，与平台无关



todo：   合约代码注释全部转为英文，要求中英双语文档readme

# 具体功能

1.影院方面

影院上架电影,**平台**给电影分配id,拥有者，影院自己设置电影价格price，分配电影场次，每个座位售出成功的usdt奖励值，售出失败的积分奖励值,~~每个区域售出成功的usdt奖励值，售出失败的积分奖励值。~~    平台根据情况给每个座位mint NFT，所有权归**影院所有**





todo：细化电影场次分配，可以分配不同的影厅;细化到每个座位的奖励分配，不同区域的租赁价格不同,售出成功奖励额度的不同，售出失败额度也不同

例如热门区域:中间位置租赁价格高，usdt奖励高;  冷门区域:如最前排，租赁价格低，但是积分奖励高      （这样可以激励租赁者也可以去租冷门区域，得到更高的积分奖励）



2.租赁者方面

租赁者在平台选择要租的电影，选择要租的位置~~或者区域~~。发起交易，平台转移nft给租赁者



3.主体

struct    NFTOfSeat{

​	seatX 				//座位号横排号

​        seatY 				//座位号列排号

}







~~listFilm				上架电影~~

listFilmWithAward(uint256 id,)	    上架电影 带有奖励机制



_awardUSDT			内部方法，奖励售出成功者usdt

_awardPoints		      内部方法，奖励售出失败者积分，用于兑换电影票，也可以激励租凭者去卖给用户获利



setUSDTAwardSingle		   设置单个座位的usdt奖励

getUSDTAwardSingle	           获取单个座位的usdt奖励

~~setUSDTAwardMulti		    设置多个座位的usdt奖励~~

~~getUSDTAwardMulti	            获取多个座位的usdt奖励~~

setPointsAwardSingle		 设置单个座位的积分奖励

getPointsAwardSingle		 获取单个座位的积分奖励

~~setPointsAwardMulti		  设置多个座位的积分奖励~~

~~getPointsAwardMulti		 获取多个座位的积分奖励~~







# 部署

usdt、eth来交易，初始化的时候给usdt地址和租赁平台的nft地址即可

平台部署：  租赁合约   nft合约
