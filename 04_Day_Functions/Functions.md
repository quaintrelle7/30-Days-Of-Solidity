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










## Omitted Function Parameter Nmes

The names of unused parameters can be omitted. Those parameters will still be present on the stack, but they are inaccessible.
