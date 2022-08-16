## Internal Function Calls

- These function calls are translated into simple jumps inside EVM. 
- Passing memory references to internally-called functions is very efficient.
- Only functions of the same contract instance can be called internally.
- Avoid recursion as every internal function usesu up stack slot and there are only 1024.


## External Function Calls

Functions can also be called using the this.g(8); and c.g(2); notation, where c is a contract instance and g is a function belonging to c. Calling the function g via either way results in it being called “externally”, using a message call and not directly via jumps. 

## Named Calls and Anonymous Function Params



- Functions Outside the contracts are also called "free functions" and have internal visibility. The code is similar to internal library functions.


# State Mutability

## View Functions

- Functions can be declared view in which case they promise not to modify the state.

The following statements are considered modifying the state:

- Writing to state variables.
- Emitting events.
- Creating other contracts.
- Using selfdestruct.
- Sending Ether via Calls.
- Calling any function not marked view or pure.
- Using low-level calls.
- Using inline assembly that contains opcodes.


- Getter methods are automatically marked view.


## Pure Functions

- Functions can be declared pure in which case they promise NOT TO READ FROM or modify the state.
- It should be possible to evaluate a pure function at compile-time given only its inputs and msg.data, but without any knowledge of current blockchain state.
- Immuatble vars can be nn-pure funs.

### The following statements are considered reading from the state:

- Reading from state variables.
- Accessing address(this).balance 
- Accessing any of the members of block, tx, msg
- Calling any function not marked pure.
- Using inline assembly that contains certain opcodes.


Pure functions are able to use revert() and require() functions to revert potential state changes when an error occurs.

Reverting a state change is not considered a "state modification". 

STATICCALL opcode.

It is not possible to prevent functions from reading the state at the level of the EVM, it's only possible to prevent them from writing to the state.
(Only view can be enforced at EVM level, Pure cannot)


## Special Functions

### Receive Ether Function

- A contract can have at most one receive function.
- Declared using receive() external payable{...}
- This function cant have args, cant return anything and must have external visibility and payable state mutability.
- can be virtual, can override and can have modifiers.


In the worst case, receive function cn only rely on 2300 gas being available(When send or transfer is used), leaving little room to perform other operations except basic logging.

The following operations will consume more gas than the 2300 gas stipend:
- Writing to storage
- Creating a Contract
- Calling an external function which consumes a large amount of gas
- Sending Ether


 If you want your contract to receive Ether, you have to implement a receive Ether function (using payable fallback functions for receiving Ether is not recommended, since the fallback is invoked and would not fail for interface confusions on the part of the sender).

## Fallback Function

-  A contract can have at most one receive function.
- Declared using fallback() external payable{...} or fallback (bytes calldata input) external [payable] returns (bytes memory output) (both without the function keyword). 
- This function must have external visibility.
- can be virtual, can override and can have modifiers.
- The fallback function is executed on a call to the contract if none of the other functions match the given function signature, or if no data was supplied at all and there is no receive Ether function. 
- The fallback function always receives data, but in order to also receive Ether it must be marked payable.


## Function overloading

A contract can have multiple functions of the same name but with different parameter types.
This process is cllled "overloading" and also applies to inherited functions.

Functions are selected as overload candidates if all arguments can be implicitly converted to the expected types. If there is not exactly one candidate, resolution fails.











## Omitted Function Parameter Nmes

The names of unused parameters can be omitted. Those parameters will still be present on the stack, but they are inaccessible.
