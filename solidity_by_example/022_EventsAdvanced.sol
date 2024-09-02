// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//事件驱动架构
//其中事件用于协调和触发流程的不同阶段，例如启动和确认转账。
contract EventDrivenArchitecture{
    event TransferInitiated(
        address indexed from,address indexed to,uint value
    );

    event TransferConfirmed(
        address indexed from,address indexed to,uint value
    );

    mapping(bytes32 => bool)public transferConfirmations; //转账确认

    //发起传输
    function initiateTransfer(address to,uint value) public{
        emit TransferInitiated(msg.sender,to,value);
    }

    //确认转账
    function confirmTransfer(bytes32 transferId)public {
        require(!transferConfirmations[transferId],"Transfer already confirmed");
        transferConfirmations[transferId] = true;
        emit TransferConfirmed(msg.sender,address(this),0);
    }

}

//事件订阅者
interface IEventSubscriber{
    function handleTransferEvent(address from,address to,uint value) external;

}

contract EventSubscription{
    event LogTransfer(address indexed from,address indexed to,uint value);
    mapping(address => bool)public subscribers;
    address[] public subscriberList;

    function subscribe() public{
        require(!subscribers[msg.sender],"Already subscribed");
        subscribers[msg.sender] = true;
        subscriberList.push(msg.sender);
    }

    function unsubscribe() public{
        require(subscribers[msg.sender],"Not subscribed");
        subscribers[msg.sender] = true;
        subscriberList.push(msg.sender);
    }

}