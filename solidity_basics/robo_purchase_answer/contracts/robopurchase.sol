pragma solidity ^0.4.11;

contract owned {
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) throw;
        _;
    }

}

contract mortal is owned {
    function kill() {
        if (msg.sender == owner) selfdestruct(owner);
    }
}

contract RoboPurchase is mortal {

    address public seller; // The ethereum address of the seller
    uint public seller_balance; // Amount of ether designated to the seller
    address public robot; // The ethereum address of the robot

    enum State { Ordered, InTransit, Completed }

    struct Purchase {
        uint value;
        address buyer;
        State state;
        uint pin;
    }

    // Build an Array or a mapping to keep up with your purchase data.
    Purchase[] public purchases;

    function RoboPurchase() {
        // Set the seller variable
        seller = msg.sender;
        // Preset the seller balance to 0
        seller_balance = 0;
        // Preset the robot to msg.sender
        robot = msg.sender;
    }

    // Add a require() modifier
    modifier require(bool _condition) {
        if (!_condition) throw;
        _;
    }

    // Add an onlySeller() modifier to throw if msg.sender is not the seller
    modifier onlySeller() {
        if (msg.sender != seller) throw;
        _;
    }

    // Add an onlyRobot() modifier to throw if msg.sender is not the robot
    modifier onlyRobot() {
        if (msg.sender != robot) throw;
        _;
    }

    event orderPlaced(uint orderNumber);
    event orderAccepted(uint orderNumber);
    event robotConfirmed();

    function setRobotAddress(address _addr) onlySeller {
        robot = _addr;
    }

    function placeOrder(uint _value) payable {

        // if msg.value > _value, the remaining amount is a tip.
        if(msg.value < _value) throw;

        // Setup a memory variable as of type Purchase
        Purchase memory j;
            // Assign the variables to the new memory variable
            j.value = msg.value;
            j.buyer = msg.sender;
            j.state = State.Ordered;
        // Push the variable to the purchases array
        purchases.push(j);

        // Get the order number and trigger the orderPlaced event
        uint orderNumber = purchases.length - 1;

        orderPlaced(orderNumber);

    }

    function acceptOrder(uint _orderNumber, uint _pin) onlySeller {

        // msg.sender needs to be seller
        if(purchases[_orderNumber].value > 0 ) { // OK
        } else throw;

        if(_pin >= 1000 && _pin <= 9999) { // OK
        } else throw;

        if(purchases[_orderNumber].state != State.Ordered) throw;

        // The state changes to InTransit
        purchases[_orderNumber].state = State.InTransit;

        // Store the pin into the order
        purchases[_orderNumber].pin = _pin;

        // The pin code is stored in the contract
        orderAccepted(_orderNumber);
    }

    function robotConfirm(uint _orderNumber, uint _pin) onlyRobot {

        // msg.sender needs to be the robot 
        // Make sure the pin code matches
        if(purchases[_orderNumber].value > 0 ) { // OK
        } else throw;

        if(_pin >= 1000 && _pin <= 9999) { // OK
        } else throw;

        if(purchases[_orderNumber].state != State.InTransit) throw;

        if(purchases[_orderNumber].pin != _pin) throw;

        // Change the state of the order to Completed
        purchases[_orderNumber].state = State.Completed;

        robotConfirmed();
        // Add purchase.value -> money to the seller_balance
        seller_balance += purchases[_orderNumber].value;
        purchases[_orderNumber].value = 0;
    }

    function withdraw() {

        // if msg.sender == seller
        // send funds to the seller addresss
        if(msg.sender == seller) {
            if(!seller.send(seller_balance)) throw;
        }

    }

}



