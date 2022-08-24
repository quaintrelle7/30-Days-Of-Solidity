# Abstract Contracts

A contract is abstract when:
- One of their functions is not implemented
- They do not provide args for all of their base contract constructors.
- Similar to Interfaces
- If a contract inherits from an abstract contract and does not implement all non-implemented functions by overriding, it needs to be marked as abstract as well.
- Abstract contracts are useful in the same way that defining methods in an interface is useful. 
- It is a way for the designer of the abstract contract to say “any child of mine must implement this method”.


# 