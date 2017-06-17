pragma solidity ^0.4.8;

contract PayExample {

	address public owner; // Owns the contract

	address public person1; // The person who pays
	address public person2; // The person who receives

	uint public etherAmount;
	uint public event_trigger;
	uint public contract_kill_request;

	event ContractKillRequested();

	function PayExample() {
		owner = msg.sender;
		event_trigger = 0;
		contract_kill_request = 0;
	}

	function setOwner(address _addr) {
		if(msg.sender == owner) {
			owner = _addr;
		} else {
			throw;
		}
	}

	function check_timeout() {


	}

	function trigger_event_trigger() {
		if(msg.sender == owner) {
			event_trigger = 1;
		} else throw;
	}

	function withdraw() {
		if(msg.sender == person2 && event_trigger == 1) {
			if(msg.sender.send(etherAmount)) {
				etherAmount = 0;
			} else {
				throw;
			}
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

	function requestContractKilled() {
		if(msg.sender == person1) {
			contract_kill_request = 1;
			ContractKillRequested();
		}
	}

	function killContract() {
		if(msg.sender == person2) {
			selfdestruct(person2);
		}
	}

}
