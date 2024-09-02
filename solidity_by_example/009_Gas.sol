// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Gas{

    uint public i;

    function gasOver() public{

        //这里运行一个循环，直到所有gas都消耗完直到交易失败
        while(true) {
            i += 1;
        }

    }

}