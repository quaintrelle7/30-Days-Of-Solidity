## Block and Transaction Properties

blockhash(uint blockNumber) returns (bytes32): hash of the given block when blocknumber is one of the 256 most recent blocks; otherwise returns zero

block.basefee (uint): current block’s base fee (EIP-3198 and EIP-1559)

block.chainid (uint): current chain id

block.coinbase (address payable): current block miner’s address

block.difficulty (uint): current block difficulty

block.gaslimit (uint): current block gaslimit

block.number (uint): current block number

block.timestamp (uint): current block timestamp as seconds since unix epoch

gasleft() returns (uint256): remaining gas

msg.data (bytes calldata): complete calldata

msg.sender (address): sender of the message (current call)

msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)

msg.value (uint): number of wei sent with the message

tx.gasprice (uint): gas price of the transaction

tx.origin (address): sender of the transaction (full call chain)


## Error Handling

assert(bool condition)
causes a Panic error and thus state change reversion if the condition is not met - to be used for internal errors.

require(bool condition)
reverts if the condition is not met - to be used for errors in inputs or external components.

require(bool condition, string memory message)
reverts if the condition is not met - to be used for errors in inputs or external components. Also provides an error message.

revert()
abort execution and revert state changes

revert(string memory reason)
abort execution and revert state changes, providing an explanatory string


## Maths and Crypto Funs


addmod(uint x, uint y, uint k) returns (uint)
compute (x + y) % k where the addition is performed with arbitrary precision and does not wrap around at 2**256. Assert that k != 0 starting from version 0.5.0.

mulmod(uint x, uint y, uint k) returns (uint)
compute (x * y) % k where the multiplication is performed with arbitrary precision and does not wrap around at 2**256. Assert that k != 0 starting from version 0.5.0.

keccak256(bytes memory) returns (bytes32)
compute the Keccak-256 hash of the input

sha256(bytes memory) returns (bytes32)
compute the SHA-256 hash of the input

ripemd160(bytes memory) returns (bytes20)
compute RIPEMD-160 hash of the input

ecrecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) returns (address)
recover the address associated with the public key from elliptic curve signature or return zero on error. The function parameters correspond to ECDSA values of the signature:

r = first 32 bytes of signature

s = second 32 bytes of signature

v = final 1 byte of signature

ecrecover returns an address, and not an address payable. 





## Members of Address Type

address.balance (uint256): balance of the Address in Wei

address.code(bytes memory) : code at the Address(can be empty)

address.codehash(bytes32) : The codehash of the Address

address payable.transfer(uint256 amount): send given amount of Wei to Address, reverts on failure, forwards 2300 gas stipend, not adjustable

address payable.send(uint256 amount) returns(bool):  send given amount of Wei to Address, returns false on failure, forwards 2300 gas stipend, not adjustable


address.call(bytes memory) returns(bool, bytes memory): issue low-level CALL with the given payload, returns success condition and return data, forwards all available gas, adjustable


DELEGATECALL —This operator allows the calling contract to send a message to an external contract but execute the related code in the context of the caller.

address.delegatecall(bytes memory) returns(bool, bytes memory): issue low-level DELEGATECALL with the given payload, returns success condition and return data, forwards all available gas, adjustable


STATICCALL allows a subset of reentrancy vulnerabilities to be avoided: if a contract's state change depends on reading data from another contract, it can safely retrieve it without ever triggering a conflicting state change.

address.staticcall(bytes memory) returns(bool, bytes memory): issue low-level STATICCALL with the given payload, returns success condition and return data, forwards all available gas, adjustable


## Contract Realted


this: current contract's type, explicitly convertible to Address

selfdestruct(Address payable recipient):
Destroy the current contract, sending its funds to the given Address and end execution. Note that selfdestruct has some peculiarities inherited from the EVM:

- the receiving contract’s receive function is not executed.
- the contract is only really destroyed at the end of the transaction and revert s might “undo” the destruction.





## Type Information




## Reserved Keywords

after, alias, apply, auto, byte, case, copyof, default, define, final, implements, in, inline, let, macro, match, mutable, null, of, partial, promise, reference, relocatable, sealed, sizeof, static, supports, switch, typedef, typeof, var.