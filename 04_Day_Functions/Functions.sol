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

// Sink Contract that uses function receive.

contract Sink{
    event Received(address, uint);
    receive() external payable{
        emit Received(msg.sender, msg.value);
    }
}

//receive and fallback functions

contract Test{
    uint x;
    //This fucntion is called for all messages sent to 
    // this contract as there is no other function,
    //Sending ether to this contact will cause an exception
    // because the fallback function does not have 'payable' modifier.
    fallback() external{x=1;}
}

contract TestPayable{
    uint x, y;
    // This function is called for all messages sent to
    // this contract, except plain Ether transfers
    // (there is no other function except the receive function).
    // Any call with non-empty calldata to this contract will execute
    // the fallback function (even if Ether is sent along with the call).

    fallback() external payable{x=2; y=msg.value;}

    // This function is called for plain ether transfers, i.e.
    // for every call with empty calldata.

    receive() external payable{x=2; y=msg.value}
}

contract Caller{

    function callTest(Test test) public returns (bool){
        (bool, success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);

        address payable testPayable = payable(address(test));
        // If someone sends Ether to that contract,
        // the transfer will fail, i.e. this returns false here.
        return testPayable.send(2 ether);
    }
}

// Function Overlaoding - same name, different parameters

contract A{
    function f(uint value) public pure returns (uint out){
        out = value;
    }

    function f(uint value, bool really) public pure returns (uint out){
        if(really){
            out = value;
        }
    }
}

// Overloaded functions are also present in the external interface. 
// It is an error if two externally visible functions differ by their
//  Solidity types but not by their external types.
// This will not compile
contract A {
    function f(B value) public pure returns (B out) {
        out = value;
    }

    function f(address value) public pure returns (address out) {
        out = value;
    }
}

contract B {
}

// Both f function overloads above end up accepting the address type
//  for the ABI although they are considered different inside Solidity.

// Overlaod Resolution and Argument Matching

contract A{
    function f(uint8 val) public pure returns(uint8 out){
        out=val;
    }

    function f(uint256 val) public pure returns(uint256 out){
        out=val;
    }

}

// calling f(50) would create a type error since 50 can be implicitly converted both to uint8 and uint256.
// f(256) would resolve to f(uint256) overload as 256 cant be converted to uint8.



