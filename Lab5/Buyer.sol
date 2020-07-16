// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Buyer {

    address private buyer;
    event BuyerSet(address indexed oldBuyer, address indexed newBuyer);
    
    modifier isBuyer() {
        require(msg.sender == buyer, "Caller is not buyer");
        _;
    }
    
    constructor() public {
        buyer = msg.sender; 
        emit BuyerSet(address(0), buyer);
    }

    function changeBuyer(address newBuyer) public isBuyer {
        emit BuyerSet(buyer, newBuyer);
        buyer = newBuyer;
    }

    function getBuyer() external view returns (address) {
        return buyer;
    }
}