// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract EtherUnits{

    //1eth = 10**18wei,wei是以太坊上的Gas的最小单位
    uint public onewei = 1 wei;
    bool public isonewei = (onewei == 1); //== 判断两者是否相等

    //1gwei = 10*9 wei
    uint public oneGwei = 1 gwei;
    bool public isoneGwei = (oneGwei == 1e9);

    //1eth = 10**18wei
    uint public oneEther = 1 ether;
    bool public isoneEther = (oneEther == 10**18); //1e18 /10**18  /1000000000000000000 的表达意思一样


}