// How to add a listener for the contract EVENTS
var listener1 = RoboPurchase.orderPlaced( {}, function(error, result) {
  if (!error) {
    var msg = "ROBOPURCHASE ORDER PLACED! Order Number:  " + result.args.orderNumber ;
    console.log(msg);
  }
});
var listener2 = RoboPurchase.orderAccepted( {}, function(error, result) {
  if (!error) {
    var msg = "ROBOPURCHASE ORDER ACCEPTED! Order Number:  " + result.args.orderNumber ;
    console.log(msg);
  }
});
var listener3 = RoboPurchase.robotConfirmed( {}, function(error, result) {
  if (!error) {
    var msg = "ROBOPURCHASE - Food has been released by ROBOT ";
    console.log(msg);
  }
});

if(acct_owner == RoboPurchase.owner()) console.log("OK");

if(acct_owner == RoboPurchase.seller()) console.log("OK");

RoboPurchase.placeOrder(web3.toWei(1, 'ether'), {from: acct1, gas: 300000, value: web3.toWei(1, 'ether')});

interface.etherBalance(RoboPurchase)
interface.etherBalance(acct1)

RoboPurchase.placeOrder(web3.toWei(.2, 'ether'), {from: acct1, gas: 300000, value: web3.toWei(.5, 'ether')});

RoboPurchase.purchases(0)

RoboPurchase.purchases(0)[0]
web3.fromWei(RoboPurchase.purchases(1)[0].toString(), 'ether');
RoboPurchase.purchases(0)[1]
RoboPurchase.purchases(0)[2]
RoboPurchase.purchases(0)[3]

RoboPurchase.purchases(1)

web3.fromWei(RoboPurchase.purchases(1)[0].toString(), 'ether');

RoboPurchase.acceptOrder(0, 4493, {from: acct_owner});
RoboPurchase.purchases(0)

RoboPurchase.setRobotAddress(acct2, {from: acct_owner});

if(acct2 == RoboPurchase.robot()) console.log("OK");

RoboPurchase.robotConfirm(0, 4493, {from: acct2});

web3.fromWei(RoboPurchase.seller_balance().toString(), 'ether');

RoboPurchase.acceptOrder(1, 3397, {from: acct_owner});
RoboPurchase.purchases(1)

RoboPurchase.robotConfirm(1, 3397, {from: acct2});

web3.fromWei(RoboPurchase.seller_balance().toString(), 'ether');

interface.etherBalance(RoboPurchase)

interface.etherBalance(acct_owner)
RoboPurchase.withdraw({from: acct_owner});
interface.etherBalance(acct_owner)

interface.etherBalance(RoboPurchase)
