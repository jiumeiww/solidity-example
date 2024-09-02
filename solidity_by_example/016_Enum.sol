// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Enum{
    
    //代表运输状态的枚举,默认缺省值是0
    enum Status{

        Pending, //0
        Shipped, //1
        Accepted,//2
        Rejected,//3
        Canceled //4
    }
    Status public status;

    function get() public view returns(Status){

        return status;

    }

    function set(Status _status) public {

        //传一个类型为Status 状态
        status = _status;
    }

    function cancel() public{

        //这样可以设置特定的枚举
        status = Status.Canceled;

    }

    function reset()public{
        delete status;
    }




}