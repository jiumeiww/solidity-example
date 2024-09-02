// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage{
    uint favoriteNumber;
    struct People{
        uint age;
        string name;

    }
    mapping (string => uint) public NameToAge;
    
    People[] public person;
    
    //当函数后面加上了virtual,说明此功能能被子合约重写
    function store(uint _favoriteNumber) public virtual{
        favoriteNumber = _favoriteNumber;
    }

    function recive() public view returns(uint){
        return favoriteNumber;
    }

    //struct/mapping/array 这三个类型的变量做名义参数时前面需要加memory/calldata
    function addPerson(string memory _name,uint _age) public{
        person.push(People({name:_name,age:_age}));
        NameToAge[_name] = _age;    
    }

}