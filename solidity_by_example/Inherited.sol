// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//继承SimpleStorage；

import "./SimpleStorage.sol";

//is这个关键字说明继承这个合约是SimpleStorage子合约
contract Inher is SimpleStorage{
    //可以添加新功能
    /*
    function add(uint a,uint b)public pure returns(uint){
        return a + b;
    }*/

    //修改父合约中原有的功能,需要加override(覆盖)才能修改
    function store(uint _favoriteNumber)public override{
        favoriteNumber = _favoriteNumber + 10;
    }

}