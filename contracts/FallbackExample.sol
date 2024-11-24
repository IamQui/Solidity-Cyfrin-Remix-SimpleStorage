// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract FallbackExample {
    uint256 public result;

    receive() external payable{
        result = 1;
    }

    /* whenever we send ETH or a transaction is made to this 
    contract (with money or without) - as long as there is no 
    data associated with the transaction - the receive function 
    will be triggered */

    fallback() external payable {
        result = 2;
    }

    /* fallback function is executed on a call to a contract 
    if none of the other functions match the given function 
    signature -or- if no data was suppied at all and there is 
    no receive function. The fallback function always receives 
    data but in order to also receive Ether it must be marked 
    payable */

}