// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Owned{
    constructor (){owner = payable(msg.sender);}
    address payable owner;
   
}

//Use 'is' to derive from another contract.
//Derived contracts can access all non-private members
//including internal functions and state variables.
//Cant be accessed externally via 'this'

contract Destructible is Owned{
// The keyword `virtual` means that the function can change
// its behaviour in derived classes ("overriding").


}