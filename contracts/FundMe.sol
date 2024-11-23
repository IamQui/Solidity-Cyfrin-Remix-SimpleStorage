// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUSD = 5;

    function fund() public payable {
        require(msg.value >= minimumUSD, "Didn't send enough ETH");
    }

    function getPrice() public {

    }

    function getConversionRate() public {}

    // Sepolia ETH/USD => 0x694AA1769357215DE4FAC081bf1f309aDC325306
        

    //function withdraw() public {}
}