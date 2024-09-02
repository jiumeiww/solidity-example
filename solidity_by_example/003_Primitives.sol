// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Primitives{
    bool public boo = true; //初始默认值是false
    
    uint8 public u8 =1;  //uint8是非负整数类型，最大值是2**8-1（256）
    uint256 public u256 = 456;
    uint256 public u = 123; //uint等同于uint256
    
    int8 public in8 = 127; //最小值负数 -128，整数127；
    int256 public in256 = 2**255 - 1; // int最小值 -2**255, 最大值是2**255-1；int等同于int256;
    
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; //
    
    bytes1 public a = 0x7b;


    //未赋值得变量都有默认值
    uint256 public defaultUint;
    int256 public defaultInt;
    bool public defaultBool;
    address public defaultAddr;


}