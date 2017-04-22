pragma solidity ^0.4.0;

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


    address public seller; // Same
    uint public seller_balance; // Amount of ether designated to the seller

    enum State { Ordered, InTransit, Completed }

    struct purchase {
        uint value;
        address buyer;
        State state;
        int8 pin;
    }

    // Build an Array or a mapping to keep up with your purchase data.

    function RoboPurchase() {
        // Set the seller variable

        // Preset the seller balance to 0

    }

    // Add a require() modifier

    // Add an onlySeller() modifier to throw if msg.sender is not the seller

    // Add an inState() modifier to throw if the state is not correct

    event orderPlaced();
    event orderAccepted(uint orderNumber);
    event robotConfirmed();

    function placeOrder(uint _value) payable 
        // Add logical modifiers here
    {

        if(msg.value < _value) throw;

        // if msg.value > _value, the remaining amount is a tip.

        // Add a new order to the system in state=Ordered

        new purchase() // new array element .push()


//        msg.sender
//        msg.value

    }


    function acceptOrder(uint _orderNumber, int8 _pin) 
        // Add logical modifiers here
    {

        // msg.sender needs to be seller
        // The order can no longer be cancelled
        // The state changes to InTransit
        // Store the pin into the order

        // The pin code is stored in the contract

    }


    function robotConfirm(uint _orderNumber, uint8 _pin) 
        // Add logical modifiers here
    {


        // msg.sender needs to be the seller (later the robot can have his own address)
        // Make sure the pin code matches

        // Change the state of the order to Completed
        // Add purchase.value -> money to the seller_balance
        // 

    }

    function withdraw() {
        // if msg.sender == seller
        // send funds to the seller addresss

    }

}




