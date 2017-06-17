pragma solidity ^0.4.8;

contract PayExample {

	address public owner; // Owns the contract

	address public person1; // The person who pays
	address public person2; // The person who receives

	uint public etherAmount;

	function PayExample() {
		owner = msg.sender;
		uint abc;
	}

	function setOwner(address _addr) {
		if(msg.sender == owner) {
			owner = _addr;
		} else {
			throw;
		}
	}

	function withdraw() {
		if(msg.sender == owner) {
//			owner.send(etherAmount);
		} else {
			throw;
		}
	}

	function pay(uint _amt, address _addr) payable {

		if(_amt != msg.value) {
			throw;
		}

        etherAmount += msg.value + 0;
	    person1 = msg.sender;
	    person2 = _addr;

	}

	function killContract() {
		if(msg.sender == owner) {
			selfdestruct(owner);
		}
	}

}
