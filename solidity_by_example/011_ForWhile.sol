// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//不要编写不受限制的循环,因为这可能会达到 gas 限制，导致你的交易失败。
//由于上述原因，while和do while循环很少使用。

contract Loop{

    function loop() public pure returns(uint,uint){

        uint numa;

        for(uint i = 0;i < 10;i++){
            if(i == 3){

                continue;

            }

            if(i == 5){
                break;
            }

            numa = 1;
        }

        uint j;
        while (j < 10){
            j++;
        }

        return (numa,j);

    }
  

}