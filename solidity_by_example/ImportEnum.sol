// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./EnumDeclaration.sol";

contract Enum{

    Status public status;

    function get()public view returns(Status){
        return status;

    }
}