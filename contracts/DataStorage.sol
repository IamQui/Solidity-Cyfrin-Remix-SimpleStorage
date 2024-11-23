// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DataStorage {
    uint256 storedData;

    function setTheStoredData(uint256 data) public {
        storedData = data;
    }

    function getTheStoredData() public view returns(uint256){
        return storedData;
    }

}