//以下是一个捐款合约功能
//允许任何用户向这个合约捐款
//允许合约部署者把用户捐的款给提走
//可以看到每个用户捐了多少
//设定一个最小金额，小于这个金额（50u），则捐款不成功

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    
    //导入接口再声明一个变量
    AggregatorV3Interface internal priceFeed;

    address public owner;

    uint minmunUSD = 100;

    address[] public funders; 

    constructor(){
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        owner = msg.sender;
    }
    //fund
    //函数加了payable修饰符就可以往里面存款
    function Fund()public payable{
        //require(ethToUSD(msg.value)>minmunUSD,"Must greater than 100u!");
        //1eth = 10**18 wei = 10**9 Gwei = 1e18 后面没加单位时候默认单位是wei
        funders.push(msg.sender);
    }
    //如何限制捐款的金额大于等于固定的U的数值，比如说最小捐100u，这时候就需要“预言机”（chainlink），因为币价是波动的


    //提取只有合约部署者才能取出
    function withdraw()public view{
        require(msg.sender == owner,"Not contract deployer");
        
        //send, transfer,call;send跟transfer都是限制2300 gas, call可以不限制gas;
        //payable(msg.sender).transfer(address(this).balance);
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //require (sendSucess,"tansaction is failed");

        //(bool callSuccess,) = payable(msg.sender).call{value:address(this).balance}("");
        //require(callSuccess,"failed transaction");

    }

    function currentEthPrice()public view returns(uint){
        (
            , 
            int price,
            ,
            ,
            
        ) = priceFeed.latestRoundData();
        return uint(price);
    }
    
    function ethToUSD(uint ethAmount)public view returns(uint){
        uint ethprice = currentEthPrice();
        uint ethInUSD = (ethprice * ethAmount)/1e26;
        return ethInUSD; 

    }

    

}