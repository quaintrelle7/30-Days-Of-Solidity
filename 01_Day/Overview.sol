//Machine-readble licenses are important where publishing
//the source code is default

// SPDX-License-Identifier: GPL-3.0


/*Pragma is a common instruction for compilers
about "How to treat the code"*/

pragma solidity >=0.4.16 <0.9.0;

/* Contract: Collection of code and data,
Every Contract has a specific address on the ethereum blockchain */

contract SimpleStorage {

    //uint: Unsigned Integer of 256 bits
    //storedData: A State Variable

    /*A State Variable are variables whose values are PERMANENTLY
    STORED in contract storage. */
    uint storedData;
    address public seller;

    modifier onlySeller() { // Modifier
        require(
            msg.sender == seller,
            "Only seller can call this."
        );
        _;
    }

    /*FUNCTIONS are executable units of code can be define inside
        or outside of the smart contract.*/

    //set is used to modify the data
    function set(uint x) public {
        storedData = x;
    }

    //get is used to retrieve the data
    function get() public view returns (uint) {
        return storedData;
    }


    /*Modifiers are used to provide control to other functions */
    //Can be overridden

    modifier onlySeller() { // Modifier
        require(
            msg.sender == seller,
            "Only seller can call this."
        );
        _;
    }

    /*- An Event stores the arguments passed in the transaction logs
    when emitted. 
     - It's an inhertiable member of the contract
     - Tells the current state of contract
     - Notify the applications about change made in contracts
     - Defined inside the contracts as GLOBAL*/

    event BalanceOfSeller(address seller, uint balance);
    function balanceOfSeller() public{

        //Trigger an Event
        emit BalanceOfSeller(msg.sender, msg.value);
    }

    //Errors

    //Struct: Custom defined Type that can group several Variables

    struct Car{

        uint speed;
        address current;
        string model;
        bool second_hand;
    }

    //Enum: Custom type with a finite set of 'constant values'

    enum State{created, inactive};
}