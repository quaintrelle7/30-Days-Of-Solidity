# Construction

- A constructor is an optional function.
- Declared with constructor keyword.
- Executed upon contract creation.
- Run contract initialisation code.


- Deployed code on the blockchain includes all the functions that are part of the public interface and functions reachable through function calls.
- Does NOT include the constructor code or internal functions only called from the constructor.
- In case of no construtor, the contract will assume the default constructor, equivalent to constructor(){}

- If the base constructors have arguments, dervived contracts need to specify all of them.
- Solidity uses "C3 Linearization" to force a specific order in directed acyclic graph. This results in monotonicity but disallows inheritance graphs.
- The constructors will always be executed in the linearized order, regardless of the order in which their arguments are provided in the inheriting contract’s constructor. 

# Inheriting Different Kinds of Members of the Same Name

It is an error if any of the following pairs in a contrcat have the same name due to inheritance:

- A function and a modifier
- A function and an event
- An event and a Modifier

Exception: A state variable getter can override an external function.







