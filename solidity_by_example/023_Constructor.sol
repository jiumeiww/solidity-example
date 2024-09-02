// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract X{
    string public name;
    constructor(string memory _name){

        name = _name;
    }
}

contract Y{
    string public text;
    constructor(string memory _text){
        text = _text;
    }
}

//第一种方式：在继承列表种传递这里的参数
contract B is X("Input to X"),Y("Input to Y"){}

contract C is X,Y{
    //在构造函数中传递参数
    //类似于函数修饰符
    constructor(string memory _name,string memory _text) X(_name) Y(_text){}

}

contract D is X,Y{
    constructor() X ("X was called") Y("Y was called"){}
}


contract E is X,Y{
    constructor() Y("Y was called") X("X was called"){}
}


