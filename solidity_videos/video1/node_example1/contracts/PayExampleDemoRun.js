var me = acct_owner;
var john = acct_acct1;
var jane = acct_acct2;

console.log("John's Balance is " + interface.etherBalance(john) + " ETH. ");
//console.log("Jane has " + interface.etherBalance(jane) + " ETH. ");

var ten_ether = web3.toWei("10", "ether");

PayExample.pay(ten_ether, jane, {from: john, value: ten_ether, gas: 300000});

console.log("Now John's Balance is " + interface.etherBalance(john) + " ETH. ");
//console.log("Jane still has " + interface.etherBalance(jane) + " ETH. ");
console.log("The contract now has " + interface.etherBalance(PayExample) + " ETH.");

console.log("Now the account owner must trigger the event for the ether to be released.");

PayExample.withdraw({from: jane}); // Should error

PayExample.trigger_event_trigger({from: me});

PayExample.withdraw({from: jane});

console.log("Jane has " + interface.etherBalance(jane) + " ETH. ");
