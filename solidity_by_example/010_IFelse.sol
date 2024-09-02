// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract IFElse{

    function foo(uint x)public pure returns(uint) {
        if (x < 10) {
            return 0;
        }else if(x < 20) {
            return 1;
        }else{
            return 2;
        }
    }

    function sanyuan(uint _x) public pure returns(uint) {
        //三元表达式：当_x < 10返回1，否则返回2
        //return _x < 10 ? 1 : 2;

        if(_x < 10) {
            return 1;
        }
        return 2;
    }


}