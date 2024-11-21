// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleStorage {
    // **Basic Types: boolean, uint, int, address, bytes**
    // bool hasFavoriteNumber = true;
    // int256 favoriteInt = -88;
    // string favoriteNumberInText = "eleven";
    // address myAddress = 0x6b686347A3f7a3f7FdA330aF7f1947006c3d452f;
    // bytes32 favoriteBytes32 = "cat";
    uint256 myFavoriteNumber;

    //uint256[] listOfFavoriteNumbers;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;
    mapping(uint256 => string) public favoriteNumberToName;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        favoriteNumberToName[_favoriteNumber] = _name;
    }





}