// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Colours {

    address owner;
    string[] colours;

    function addColour(string memory colour) public returns(string memory, uint) {
        colours.push(colour);
        uint colourIndex = colours.length - 1;
        emit ColourAdded(msg.sender, colourIndex);
        string memory message = "New colour: ";
        return (message, colourIndex);
    }
    function coloursLength() public view returns(string memory, uint) {
        string memory lengthMessage = "Length of colours: ";
        return (lengthMessage, colours.length);
    }

    function viewColour(uint index) private view returns (string memory) {
        require (index < colours.length, "Colour does not exist");
        return colours[index];
    }

    event ColourAdded(address from, uint index);
}