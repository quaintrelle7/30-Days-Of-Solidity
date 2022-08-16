- Contrcats in solidity are similar to classes in OOPs languages.
- Calling a function perform an EVM function call.
- Contrcats can be created from outside via ethereum transactions or from within Solidity contracts.
- A constructor is optional, only one is allowed, overloading is not supported.
- After the constructor has executed the final code is stored on the blockchain.
- The code includes: all public, external functions and the functions that are reachable from function calls.
- The code not includes: constructor code or internal functions
- Internally, constructor arguments are passed ABI encoded after the code of contract.
- Cyclic creation dependencies ain't possible.


## Visibility and Getters

### State Variable Visibility

- public: 
- internal:
- private:

### Function Visibility

- external
- public
- internal
- private

### Getter Functions

- The compiler automatically creates getter functions for all public state vars.
- It has external visibility.
- If the symbol is accessed internally(i.e. without this), it evaluates to a state variable.
- If accessed externally, it evaluates to a function.


## Function Modifiers

- Modifiers can be used to change the behaviour of the functions in the declarative way.
- Use a modifier to automatically check a condition prior to executing the function.
- Modifiers are inheritable properties of contracts and may be overriden by derived contract only iffff marked "virtual".


### Constant and Immutable State Variables

constant: Value has to be fixed at compile-time
immutable: Value can be assigned at construction time
It's also possible to define "constant: variables at the file level.


Gas costs of constant and immutables are much lower compaed to regular state variables.

- For a const, expression assigned to it is copied to all the places where it's accessed.
- Immutable vars are evaluated at construction time and their value is copied to all the places in the code where they are accessed. 32 bytes are reserved for this, due to this const variables can be cheaper many times.

- For constant Variables, the value has to be a const at a compile time and it has to be assigned where the variable is declared.
- Expressions having side-effect on memory allocations are allowed,  but those that might have a side-effect on other memory objects are not. The built-in functions keccak256, sha256, ripemd160, ecrecover, addmod and mulmod are allowed (even though, with the exception of keccak256, they do call external contracts).

#### Immutable

- Variables declared as immutable are a bit less restricted than those declared as constant.
- Immutables that are assigned at their declaration are only considered initialized once the constructor of the contract is executing.


## Functions


