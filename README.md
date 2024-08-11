# 简介

为影院和消费者提供一个平台用于租赁影院座位，在每场电影放映后，给予未售出座位的租赁者一定奖励

# 具体功能

1.影院方面

mint 接口，给影院方输入参数，从而 mint 座位对应的 NFT

参数：价格，时间（或场次），对应座位，等等。

问题：如何将参数写入 NFT 属性，如何使用时间作为依据（难以实现可以先用场次），

2.消费者方面

lease 接口，选择影院座位，交易对应 NFT

3.主体

film 接口，每场电影放映结束触发，发放奖励等等

buy 接口，每场电影座位售出后触发。

award，奖励机制

# 根据现有项目，需要做修改的部分：

1.NFT，mint 接口，基本完全重写，需要将参数作为 NFT 属性 mint。

2.award，直接交易 ETH，使用 ETH 作为奖励，USDT 可后续拓展。
3.film，buy 等略作修改。
