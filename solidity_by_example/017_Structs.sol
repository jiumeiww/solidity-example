// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Todos{

    //建立一个名为学生的数组结构，里面有三个不同的属性
    struct students{
        string name;
        uint grade;
        bool pass;
    }

    students[] public stu;

    function set(string calldata _name,uint _grade,bool _pass)public{
        
        //第一种往数组里传参数的方法；
        //stu.push(students(_name,_grade,_pass));

        //通过关键字往里传参数
        //stu.push(students({grade : _grade,name:_name,pass:_pass}));

        //通过一个memory建立一个空的变量
        students memory Mystu;
        Mystu.name = _name;
        Mystu.grade = _grade;
        Mystu.pass = _pass;
        stu.push(Mystu);


    }
        //当变量前加了public,默认创建了一个get函数

    //修改想修改的值
    function changename(uint _index,string calldata _name)public{
        students storage newstudent = stu[_index];
        newstudent.name = _name;
    }


}