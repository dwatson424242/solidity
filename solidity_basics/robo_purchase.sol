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

    struct purchase {
        uint value;
        address buyer;
        State state;
        int8 pin;
    }

    // Build an Array or a mapping to keep up with your purchase data. Call it "purchases"

    function RoboPurchase() {
        // Set the seller variable

        // Preset the seller balance to 0

        // Preset the robot to msg.sender

    }

    // Add a require() modifier

    // Add an onlySeller() modifier to throw if msg.sender is not the seller

    // Add an onlyRobot() modifier to throw if msg.sender is not the robot

    event orderPlaced(uint orderNumber);
    event orderAccepted(uint orderNumber);
    event robotConfirmed();

    function setRobotAddress(address _addr) onlySeller {
        robot = _addr;
    }

    function placeOrder(uint _value) payable {


        if(msg.value < _value) throw; // if msg.value > _value, the remaining amount is a tip.

        // Setup a memory variable as of type Purchase

        // Assign the variables to the new memory variable

        // Push the variable to the purchases array

        // Get the order number and trigger the orderPlaced event

    }


    function acceptOrder(uint _orderNumber, uint _pin) 
        // Only allow the owner to run this function
    {

        // Check to make sure the order number is valid

        // Verify that the pin code is 4 digits between 1000 and 9999

        // Verify that the Order State is currently 'Ordered'

        // Change the Order State to 'InTransit'

        // Store the pin to the order

        // Trigger the orderAccepted event for this order

    }


    function robotConfirm(uint _orderNumber, uint _pin) 
        // Only allow the Robot to run this funciton
    {

        // Check to make sure the order number is valid

        // Verify that the pin code is 4 digits between 1000 and 9999

        // Verify that the Order State is currently 'InTransit'

        // Verify that the pin matches the pin in the order.

        // Change the state of the order to 'Completed'

        // Trigger the robotConfirmed event

        // Add add the value from the order to the seller balance

        // Set the value of the order to 0

    }

    function withdraw() {

        // if msg.sender == seller, send funds to the seller addresss

    }

}



