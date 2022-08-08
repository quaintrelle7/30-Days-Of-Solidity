pragma solidity >=0.5.0<0.9.0

contract MappingExample{

    mapping(address=>uint)public balances;

    function update(uint newBalance) public{
        balances[msg.sender]= newBalance;
    }
}

contract MappingUser{
    function f() public returns (uint){
        MappingExample m = new MappingExample();
        m.update(100);
        return m.balances(address(this));
    }
}

//Facing the BigNumber Issue when running it
//https://github.com/ChainSafe/web3.js/issues/2077