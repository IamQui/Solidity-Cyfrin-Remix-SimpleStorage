// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUSD = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        msg.value.getConversionRate();
        require(msg.value.getConversionRate() >= minimumUSD, "Didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value; 
    }
    
    function withdraw() public onlyOwner {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;

        }
        funders = new address[](0);
        // msg.sender = address
        // payable(msg.sender) = payable address

        // to send ETH (or native currency): 3 ways

        // 1. transfer: (capped at 2300 gas, if more used, throws error)
        // payable(msg.sender).transfer(address(this).balance);
        // transfer automatically reverts if fails

        // 2. send: (capped at 2300 gas, if more used, returns bool if successful or not)
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        // send will only revert if you add a require statement

        // 3. call: (forward all gas or set gas, returns bool)
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
        // call function returns 2 variables
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Owner Only!");
        _;
    }
}