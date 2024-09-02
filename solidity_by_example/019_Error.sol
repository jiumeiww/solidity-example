// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// require用于在执行之前验证输入和条件。
// revert类似于require。详情见下面的代码。
// assert用于检查代码是否绝对不能为假。断言失败可能意味着存在错误

contract Error1{
    //require这个关键字用于验证以下条件
    //输入
    //执行前的条件是否满足
    //其他函数返回值是否满足条件

    function testRequire(uint _i)public pure{
        require(_i > 10,"i must greater than Ten"); //代表的是_i< 10就会报警后面这句话
    }

    function testRevert(uint _i)public pure{
        if(_i <= 10){
            revert("Input must be greater than 10");
        }
    }

    uint public num;
    
    function testAssert() public view{

        //Assert只能用于测试内部错误和不变量
        //默认值总是为0
        assert(num == 0);

    }

}