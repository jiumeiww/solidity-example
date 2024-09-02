// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//映射不能遍历
/*
contract Mapping{

    //mapping的语法是mapping(keyType => valueType)
    //keyType可以是 string bool int address bytes 或者是某个已经部署的合约
    //valueType可以是多种类型变量 甚至是另外一个mapping或者是一个array(动态数组)

    mapping(address => uint) public myMap; //定义了一个map方法，将一个地址跟一个数字匹配起来

    function getadd(address _addr) public view returns(uint){
        
        //返回的是这个mapping方法对应的数，如果没有则返回默认值0
        return myMap[_addr];
    }

    //更新该地址对应的数
    function set(address _addr,uint _i)public {
        myMap[_addr] = _i;
    }

    function del(address _addr) public {

        //delete就是把每个地址匹配的值恢复为初始值0，不是删除，也不能删除
        delete myMap[_addr];

    }


}*/

//嵌套映射

contract NestedMapping{

    mapping(address => mapping(uint => bool)) public nested; //将地址跟另一个mapping匹配到一起

    function get2(address _addr1,uint _i)public view returns(bool){

        return nested[_addr1][_i];

    }

    function set2(address _addr1,uint _i,bool _boo)public{

        nested[_addr1][_i] = _boo;

    }

    function del2(address _addr1,uint _i)public{
        delete nested[_addr1][_i];
    }


}