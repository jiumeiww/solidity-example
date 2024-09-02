// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//函数修饰符就是在函数调用之前和/或之后运行的代码（例如onlyOwner）
contract FunctionModifier{

    address public owner;
    uint public x =10;
    bool public locked;

    constructor(){
        owner = msg.sender; //把owner地址变成我们的合约部署者

    }

    //modifier是自带关键字，语法跟function很像
    //require也可以多个写一起
    modifier onlyOwner(){
        require(msg.sender == owner,"Not owner");


        _; //代表函数主体

    }

    modifier vaildAddress(address _addr){
        require(_addr != address(0),"Not vaild address");


        _;

    }

    function changeOwner(address _newOwner)public onlyOwner vaildAddress(_newOwner){
        owner = _newOwner;
    }


    // 修饰符可以在函数之前和/或之后甚至是中间被调用。
    // 该修饰符防止函数在 while 时被调用
    // 它仍在执行
    // 修饰符避免一个函数被重入攻击，也就是一个函数没执行完马上再次调用

    modifier noReentrancy(){
        require(!locked,"No reentrancy");

        locked = true; //！locked就是一个true

        _;

        locked = false;

    }

    
    function decrement(uint i)public {

        x -= i;
        if (i > 1){
            decrement(i-1);
        }

    }


}