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
