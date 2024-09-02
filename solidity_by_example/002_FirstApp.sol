// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

//这是一个简单的合约，可以获取、增加和减少此合约中的存储的计数

contract Counter{

    uint256 public count;

    //获取当前的额度
    function getCount() public view returns(uint256){

        return count;
    }
    //计数+1的函数
    function inc() public {
        count ++;
    }
    
    //计数-1的函数
    function dec () public {
        count --;
    }

}