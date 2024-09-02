// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Variables{
     
    //通过内置的type函数获取当前的类型变量的最大值最小值
    int public a = type(int).max;  

    //在函数外声明,存储在区块链上(如果是部署到主网要慎重使用)
    string public text = "Hello";  
    uint256 public num = 123;

/*
    function doSomething() public view returns(uint){

        //在函数内部声明,不存储在区块链上,这是内存变量
        uint256 i = 456;

        //全局变量,提供有关区块链的信息，函数里外都能用
        uint time =  block.timestamp; //当前区块的时间戳
        address sender = msg.sender;


    }*/



 
}