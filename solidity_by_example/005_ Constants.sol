// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Constants{

    //constant修饰符代表这个变量不能被更改，减少gas消耗（大写是常量变量的编码约定）
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;

    uint256 public constant MY_UINT = 123;

}