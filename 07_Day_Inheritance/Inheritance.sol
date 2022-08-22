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

    function destroy() virtual public{
        if(msg.sender==owner) selfdestructor(owner);
    }

}

//abstract function just as an interface

abstract contract Config{
    function lookup(uint id) public virtual returns(address adr);
}

abstract contract NameReg{
    function register(bytes32 name) public virtual;
    function unregister()public virtual;
}

//Multiple inheritance case

contract Named is Owned, Destructible{
    constructor(bytes32 name){
        Config config = Config(0x);
        NameReg(config.lookup(1)).register(name);
    }

}

//function can be overriden by another function with same name and 
//i/o params.
//use override keyword and virtual keyword to override.

function destroy() public virtual override{
    if(msg.sender == owner){
        Config config = Config(0x);
        NameReg(config.lookup(1)).unregister();
        //It's still possible to call a specific overridden function
        Destructible.destroy();
    }
}

//If a constructor takes an argument, it needs to be
//provided in the header or modifier-invocation-style at
//the constructor of the derived contract

//See for named

contract PriceFeed is Owned, Destructible, Named("Goldfeed){
    function updateInfo(uint newInfo) public{
        if(msg.sender == owner) info - newInfo;

        //Here, we only specify 'override' and not 'virtual'
        // This means that contracts deriving from `PriceFeed`
    // cannot change the behaviour of `destroy` anymore.

    function destroy() public override(Destructible, Named){Name.destroy();}
    function get() public view returns(uint r){return info;}

    uint info;

    }
}


//Summary

ontract owned {
    constructor() { owner = payable(msg.sender); }
    address payable owner;
}

contract Destructible is owned {
    function destroy() public virtual {
        if (msg.sender == owner) selfdestruct(owner);
    }
}

contract Base1 is Destructible {
    function destroy() public virtual override { /* do cleanup 1 */ Destructible.destroy(); }
}

contract Base2 is Destructible {
    function destroy() public virtual override { /* do cleanup 2 */ Destructible.destroy(); }
}

contract Final is Base1, Base2 {
    function destroy() public override(Base1, Base2) { Base2.destroy(); }
}

// A call to Final.destroy() will call Base2.destroy because we specify it explicitly in the final override, 
// but this function will bypass Base1.destroy. The way around this is to use super

contract Base1 is Destructible {
    function destroy() public virtual override { /* do cleanup 1 */ super.destroy(); }
}


contract Base2 is Destructible {
    function destroy() public virtual override { /* do cleanup 2 */ super.destroy(); }
}

contract Final is Base1, Base2 {
    function destroy() public override(Base1, Base2) { super.destroy(); }
}

Final inheritance graph for above contract is:
Base2, Base1, Destructible, owned


// Function Overriding

contract Base
{
    function foo() virtual external view{}
}

contract Middle is Base{}

contract Inherited is Middle{

    //Doubt
    //not changing function behaviour as virtual is not specified
    //Just changing the mutability
    function foo() override public pure{}
}

Public state variables can override external 
functions if the parameter and return types of the 
function matches the getter function of the variable:

contract A
{
    function f() external view virtual returns(uint) { return 5; }
}

contract B is A
{
    uint public override f;
}

// Modifier Overriding
