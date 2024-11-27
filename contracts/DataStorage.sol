// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract DataStorage {
    uint256 storedData;

    function setStoredData(uint256 _storedData) public {
        storedData = _storedData;
    }

    function getStoredData() public view returns(uint256) {
        return storedData;
    }
}