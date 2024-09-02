// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 监听事件并更新用户界面
// 一种廉价的存储方式
// 存链上太贵了

contract Events{
    //最多可以索引三个参数
    event Log(address indexed sender,string message); //indexed表示有序的sender
    event AnotherLog();

    function test() public{
        //emit释放日志
        emit Log(msg.sender,"Hello World!");
        emit Log(msg.sender,"Hello EVM!");
        emit AnotherLog();
    }

}