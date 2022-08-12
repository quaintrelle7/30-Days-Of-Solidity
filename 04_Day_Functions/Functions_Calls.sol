// SPDX-License-Identifier: GPL-3.0


//Internal Function Calls
//This example doesn't make any sense, just refer for internal calls

pragma solidity >=0.4.22<0.9.0;

contract C{
    function g(uint a) public pure returns(uint ret){return a + f()}
    function f() internal pure returns (uint ret) { return g(7) + f()}

}

//External functions
//Don't specify gas values explicitly as gas costs and opcodes 
//may change in future

contract Infofeed{
    function info() public payable returns(uint ret){return 42;}
}

contract Consumer{
    Infofeed feed;
    function setFeed(Infofeed addr) public {feed=addr;}
    function callFeed() public{feed.info{value:10, gas:800}();}
}


//Omitted Function Parameter Names

contract C{
    //omitted name for parameter

    function func(uint k, uint) public pure returns(uint){
        return k;
    }
}