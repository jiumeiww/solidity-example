// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//通过将最后一个元素复制到要删除的位置来删除数组元素


contract ArrayRaplaceFromEnd{

    uint[] public arr = [1,2,3,4,5,6];

    function remove(uint i)public{

        //顺序无法保证
        arr[i] = arr[arr.length -1];
        arr.pop();
    }

    function get()public view returns(uint[] memory){

        return arr;

    }


}