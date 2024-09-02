// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Immutable{

    //不可变变量类似于常量。不可变变量的值可以在构造函数中设置，但之后不能修改。
    address public immutable My_ADDR;
    uint256 public immutable numb;

/* 这里使用了构造函数，会报错，先注释
    constructor() {
        MY_ADDR = msg.sender;
        numb = 200;
    }*/


}