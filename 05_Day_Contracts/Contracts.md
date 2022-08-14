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

