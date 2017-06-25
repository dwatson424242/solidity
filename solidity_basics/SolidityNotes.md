### Solidity Questions & Answers

# What is the difference between msg.sender and tx.origin

Refer to https://ethereum.stackexchange.com/questions/1891/whats-the-difference-between-msg-sender-and-tx-origin

```
With msg.sender the owner can be a contract.
With tx.origin the owner can never be a contract.
```

# Does using a throw consume all of the gas?

Yes.

Refer to: https://ethereum.stackexchange.com/questions/2307/why-does-a-solidity-throw-consume-all-gas

Also keep an eye on EIP #206 REVERT command. https://github.com/ethereum/EIPs/pull/206/files



