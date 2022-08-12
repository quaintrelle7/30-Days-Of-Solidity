## Internal Function Calls

- These function calls are translated into simple jumps inside EVM. 
- Passing memory references to internally-called functions is very efficient.
- Only functions of the same contract instance can be called internally.
- Avoid recursion as every internal function usesu up stack slot and there are only 1024.


## External Function Calls

Functions can also be called using the this.g(8); and c.g(2); notation, where c is a contract instance and g is a function belonging to c. Calling the function g via either way results in it being called “externally”, using a message call and not directly via jumps. 

## Named Calls and Anonymous Function Params




## Omitted Function Parameter Nmes

The names of unused parameters can be omitted. Those parameters will still be present on the stack, but they are inaccessible.
