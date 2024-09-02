// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//数组具有固定大小或动态大小
contract Array{
    //初始化数组的几种方式
    uint[] public arr; //动态长度数组 
    uint[] public arr1 = [1,2,3,4,5]; //初始长度5位
    uint[18] public myArray; //固定长度为18的数组，默认每个元素是0

    function get(uint i)public view returns(uint){
        return arr[i];
    }


    //可以通过get函数返回整个数组，注意不要返回动态长度数组
    function getArr()public view returns(uint[] memory){
        return arr1;
    }

    //push方法：在数组末尾添加一个i整数
    function push(uint i) public{
        arr1.push(i);
    }

    //对于动态长度数组，pop就是删除数组最后一个元素
    function pop() public{
        arr1.pop();
    }

    //数组有个属性 length
    function getLength() public view returns(uint){

        return arr.length;
    }

    function del(uint index)public{

        delete arr1[index];
    }

    //想要在内存中创建一个数组，只能创建一个固定长度数组
    /*
    function examples()external{
        uint[] memory a = new uint[](5);
    }*/


}


