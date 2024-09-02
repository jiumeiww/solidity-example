// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract SimpleStorage{

    uint public numa; //在区块链上存储了一个numa的变量

    // 发送交易写入状态变量，需要给参数传值
    function set(uint _numa) public {

        numa = _numa;
    } 

    // 不发送交易的情况下读取状态变量
    function get() public view returns(uint){
        return numa;

    }


}