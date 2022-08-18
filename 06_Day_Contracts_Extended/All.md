# Events

- Solidity events give an abstraction on top of the EVM's logging functionality.
- Applications can listen to these events through an RPC interface of an ethereum client.
- Inheritable memebrs of the contracts.
- They cause the arguments to be stored in transaction's log- A data structure in blockchain.
- Logs are associated with the address of the contract.
- The Log and its event data is not accessible from within contracts.

## Members of Events
- event.selector: For non-anonymous events, this is bytes32 value containing keccak256 hash of the event signature.

## Errors and Revert Statement

- They can be define inside or outside of contracts(including interfaces and libraries).

# Inheritance

