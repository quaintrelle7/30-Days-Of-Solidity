# Libraries

- Similar to contracts.
- Purpose is the reusing the code using DELEGATECALL.
- If Library funs are called, their code is executed in the contexxt of calling contract.
- this points to the calling contract.
- Storage from the calling contract can be accessed.
 Library functions can only be called directly (i.e. without the use of DELEGATECALL) if they do not modify the state (i.e. if they are view or pure functions), because libraries are assumed to be stateless. In particular, it is not possible to destroy a library.


### Restrictions on libraries:

 - can't have state variables.
 - can't inherit not be inherited
 - can't receive ether
 - can't be destroyed


## Function Signatures and Selectors in Libraries

The following identifiers are used for the types in signatures:

- Value types, non-storage string and bytes use the same identifiers

# Using For

The directive using A for B can be used to attach functions A as mmeber functions to any type B/


