// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*
//合约调用部分第一种
contract SimpleStorage{
    uint favoriteNumber;
    struct People{
        uint age;
        string name;

    }
    mapping (string => uint) public NameToAge;
    
    People[] public person;

    function store(uint _favoriteNumber) public{
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

}*/

import "./SimpleStorage.sol";  //这是第二种导入，与第一种一样

/*
contract StorageFactory{
    //新建了一个对象，对象的类型时上面的合约（通过一个合约部署另一个合约）
    SimpleStorage public simpleStorage;
    
    function CreateSimpleStorage()public{
        simpleStorage = new SimpleStorage(); //new这个关键字就是部署了一个新的合约

    }
}*/


contract StorageFactory{
    //新建了一个对象，对象的类型时上面的合约（通过一个合约部署另一个合约）
    SimpleStorage[] public simpleStorageArray;
    
    function CreateSimpleStorage()public{
    SimpleStorage simpleStorage = new SimpleStorage(); //new这个关键字就是部署了一个新的合约
    
    simpleStorageArray.push(simpleStorage); //也可以写成simpleStrorageArray.push(new SimpleStorage()); 这样就可以省略上面的临时声明的一个对象
    }

    //怎么调用每个合约功能，每当跟链上已部署合约交互需要两个对象： Address 、ABI
    //先操作通过一个函数调用
    function SFstore(uint _simpleStorageIndex,uint _SFNumber)public{
        simpleStorageArray[_simpleStorageIndex].store(_SFNumber);

    }

    function SFrecive(uint _simpleStorageIndex)public view returns(uint){
        return simpleStorageArray[_simpleStorageIndex].recive();

    }

    //合约之间可以相互组合调用

}
