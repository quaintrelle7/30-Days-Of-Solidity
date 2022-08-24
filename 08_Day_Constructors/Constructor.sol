pragma solidity >=0.7.0<0.9.0;

// You can use internal parameters in a constructor
//  (for example storage pointers). In this case, 
//  the contract has to be marked abstract, because 
//  these parameters cannot be assigned valid values
//   from outside but only through the constructors 
//   of derived contracts.


abstract contract A{
    uint public a;

    constructor(uint a_)
    {
        a = a_;
    }
}

contract B is A(1)
{
    constructor(){}
}

// Arguments for Base Constructors

contract Base{
    uint x;
    constructor(uint x_){x=x_;}
}

//Specify directly in inheritance list
contract Derived1 is Base(7){
constructor(){}
}

//or through a modifier of the derived constructor

contract Derived2 is Base{
    constructor(uint y)Base(y*y){}
}

//declare abstract

abstract contract Derived3 is Base{}

//Have the next concrete derived contract initialize it

contract DerivedFromDerived is Derived3{
    constructor() Base(10+10){}
}

// Lienarization problem
contract X{}
contract A is X{}

//Won't compile
contract B is A, X{}

// Above program will throw the error
//  "Linearization of Inheritance Graph is Impossible"

Reason: B requests X to override A(By specifying A,X in this order)
But: A is overriding X in second, which is contradiction
An can't be resolved.

//Constructors will always be executed in linearized orders
contract Base1 {
    constructor() {}
}

contract Base2 {
    constructor() {}
}

// Constructors are executed in the following order:
//  1 - Base1
//  2 - Base2
//  3 - Derived1
contract Derived1 is Base1, Base2 {
    constructor() Base1() Base2() {}
}

// Constructors are executed in the following order:
//  1 - Base2
//  2 - Base1
//  3 - Derived2
contract Derived2 is Base2, Base1 {
    constructor() Base2() Base1() {}
}

// Constructors are still executed in the following order:
//  1 - Base2
//  2 - Base1
//  3 - Derived3
contract Derived3 is Base2, Base1 {
    constructor() Base1() Base2() {}
}


