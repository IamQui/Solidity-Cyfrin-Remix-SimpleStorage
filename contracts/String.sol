// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract String{
    string public pooh;

    function setPooh(string memory _pooh) public {
        pooh = _pooh;
    }
}