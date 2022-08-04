/*Enums: These are user-defined type
Requires atleast one member.
Default Value is first member.
Enums cannot have more than 256 members 
Not Part of the abi */

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.8;

contract test{
    enum PrioritizeHim{LOW, MEDIUM, HIGH}
    PrioritizeHim choice;
    PrioritizeHim constant defaultChoice = PrioritizeHim.MEDIUM;

    function setHigh() public{
        choice = PrioritizeHim.HIGH;
    }

    function getChoice() public view returns (PrioritizeHim)
    {
        return choice;
        //By Defaul this is LOW
    }
    function getDefaultChoice() public pure returns(uint){
        return uint(defaultChoice);
    }
}