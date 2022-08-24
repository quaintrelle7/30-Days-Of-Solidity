pragma solidity >=0.8.0<0.9.0;

//We define a new struct datatype that will be used
//to hold its data in the calling contract.

struct Data{
    mapping(uint => bool) flags;
}

library Set{
    //Note: The first parameter is of type "storage reference" and
    //thus only its sotrage address and not its contents is passed as
    //part of the call.

    function insert(Data storage self, uint value) public returns(bool)
    {
        if(self.flags[value])
        return false;
        self.flags[value] = true;
        return true;
    }

    function remove(Data storage self, uint value) public returns(bool)
    {
        if(!self.flags[value]) return false;
        self.flags[value] = false;
        return true;
    }

    contract C{
        Data knownValues;

        function register(uint value) public{
            //lib funcs can be called without
            //specific instance o fthe libary
            //instance will be the current contract.

            require(Set.insert(knownValues, value));
        }
    }
}

//It's possible to obtain the address of a library by converting
//library type to the address type i.e. using address(LibraryName)
