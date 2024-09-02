// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


//第一种方式：数组通过移位移除
contract ArrayRemoveByShifting{

    uint[] public arr = [1,2,3,4,5,6];

    function remove(uint _i)public{
        require(_i < arr.length,"this out of bound");

        for(uint i = _i;i < arr.length -1;i++){

            arr[i] = arr[i + 1];

        }
        arr.pop();
    }

    function get()public view returns(uint[] memory){

        return arr;

    }


}