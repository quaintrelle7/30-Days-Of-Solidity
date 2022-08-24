pragma solidity >=0.7.0<0.9.0;

//Examples of Abstract contracts

//Function is declared but isn't implemented

abstract contract Feline{
    function uternace()public virtual returns(bytes32);
}

//Uses of abstract contract

contract Cat is Feline {
    function utterance() public pure override returns (bytes32)
     { return "miaow"; }
}


//Interface

interface Token {
    enum TokenType{FT, NFT}
    struct Coin{ string obverse, string reverse;}
    function transfer(address recipient, uint amount) external;
}

interface ParentA{
    function test() external returns (uint256);
}

interface ParentB{
    function test() external returns(uint256);

}

interface SubInterface is ParentA, ParentB{
    // Must redefine test in order to assert that the parent
    // meanings are compatible.

    function test() external override(ParentA, ParentB) returns(uint256);
}