// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Function{

    //使用pure不需要读取区块链上的任何变量
    //函数可以进行多个返回值
    function returnMany()public pure returns(uint,bool,uint){
        return (1,true,2);
    }

    //返回值可以命名
    function named() public pure returns (uint x,bool b,uint y){
        return(1,true,2);
    }
    

    function assigned() public pure returns (uint x,bool b,uint y){
        x = 1;
        b = false;
        y = 2;
    }

    //解构赋值练习
    function destructingAssignments()public pure returns(uint,bool,uint,uint,uint){
        (uint i,bool b,uint j) = returnMany();
        (uint x,,uint y) = (4,5,6);
        return (i,b,j,x,y);
    }


    //数组可以作为输入和返回参数，Mapping这个类型不能作为输入值
    function arrayInput(uint[] memory _arr)public{}

    uint[] public arr;

    function arrayOutput() public view returns(uint[] memory){
        return arr;
    }


    
}

//使用键值调用函数
/*
contract XYZ{
   function someFuncWithManyInputs(uint x,uint y,uint z,address a,bool b,string memory c)public pure returns(unit){}

   function callFunc()external pure returns(uint){
    return someFuncWithManyInputs(1,2,3,address(0),true,"c");
   } 

   function callFuncWithKeyValue() external pure returns(uint){
    return someFuncWithManyInputs({
        a:address(0),
        b:true,
        c:"c",
        x:1,
        y:2,
        z:3
    });
   }
}*/