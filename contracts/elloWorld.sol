// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


contract elloWorld {
    string hello;

    function setHello(string memory _hello) public {
        hello = _hello;
    }

    function sayHello() public view returns(string memory){
        return hello;
    }
}