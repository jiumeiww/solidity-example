// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// public- 任何合约和账户都可以调用
// private- 仅在定义函数的合约内部
// internal- 仅限继承函数的内部合约
// external- 只有其他合约和账户可以调用

contract Base{

    // 私有函数只能被调用
    // 在这个合约中,继承该合约的合约不能调用该函数。
    
    function privateFunc()private pure returns(string memory){
        return "private function called";
    }
/*   调用直接报错了
    function testPrivateFunc() public pure returns(string memory){
        renturn privateFunc();
    }*/

    // 可以调用内部函数
    // 在这个合约中 继承此合约的内部合约
    function internalFunc() internal pure returns(string memory){
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns(string memory){
        return internalFunc();
    }

    // 可以调用公共函数
    // 在这个合约中
    // 继承此合约的内部合约
    // 通过其他合约和账户

    function publicFunc() public pure returns(string memory){
        return "public function called";
    }

    // 只能调用外部函数
    // 通过其他合约和账户
    function externalFunc() external pure returns(string memory){
        return "external function called";
    }

    //状态变量
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";


}

// 继承合约无权访问私有函数
    // 和状态变量
    // 函数 testPrivateFunc() public pure returns (字符串内存) {
    // 返回 privateFunc();
    // }

    // 可以在子合约内部调用内部函数。
contract Child is Base{
    function testInternalFunc() public pure override returns(string memory){
        return internalFunc();
    }
}