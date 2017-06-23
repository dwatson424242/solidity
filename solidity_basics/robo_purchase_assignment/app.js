global.solc = require("solc");
global.fs = require("fs");
global.Web3 = require("web3");

global.config = {
        rpc: {
                host: "localhost",
                port: "8545"
        }
}

var provider = new Web3.providers.HttpProvider("http://localhost:8545");
global.web3 = new Web3(provider);

global.acct_owner = web3.eth.accounts[0];
global.acct1 = web3.eth.accounts[1];
global.acct2 = web3.eth.accounts[2];


class Interface {

  // Converts Hex to String
  hex2a(hexx) {
    var hex = hexx.toString();//force conversion
    var str = '';
    for (var i = 0; i < hex.length; i += 2)
        str += String.fromCharCode(parseInt(hex.substr(i, 2), 16));
    return str;
  }

  // Returns the current balance of a contract or account
  etherBalance(contract) {
    switch(typeof(contract)) {
      case "object":
        if(contract.address) {
          return global.web3.fromWei(global.web3.eth.getBalance(contract.address), 'ether').toNumber()
        } else {
          return new Error("cannot call getEtherBalance on an object that does not have a property 'address'")
        }
        break
      case "string":
        return global.web3.fromWei(global.web3.eth.getBalance(contract), 'ether').toNumber()
        break
    }
  }

  // CONTRACT FUNCTIONS //
  // returns the contract name based on the source code
  contractName(source) {
    var re1 = /contract.*{/g
    var re2 = /\s\w+\s/
    return source.match(re1).pop().match(re2)[0].trim()
  }

  // Compiles a contract from source code and deploys it
  createContract(source, options={}) {
  	
    var compiled = solc.compile(source)
    if(global.argv == 'verbose') { console.log(compiled) }
    var contractName = this.contractName(source)
    if(global.argv == 'verbose') { console.log(contractName) }
    var comp = [];

    if (typeof compiled["contracts"][':'+contractName]["bytecode"] !== 'undefined') {
      comp = compiled["contracts"][':'+contractName];
    } else if(typeof compiled["contracts"][contractName]["bytecode"] !== 'undefined') {
      comp = compiled["contracts"][contractName];
    } else {
      console.log("COMPILE ERROR: Could not find the name of the contract: "+contractName);
    }
    var bytecode = comp["bytecode"]
//    if(global.argv == 'verbose') { console.log(bytecode) }
    var abi = JSON.parse(comp["interface"])
//    if(global.argv == 'verbose') { console.log(abi) }
    var contract = global.web3.eth.contract(abi)
//    if(global.argv == 'verbose') { console.log(contract) }
    var gasEstimate = global.web3.eth.estimateGas({ data: bytecode })
//    if(global.argv == 'verbose') { console.log(gasEstimate) }

    var deployed = contract.new(Object.assign({
      from: global.web3.eth.accounts[0],
      data: bytecode,
      gas: gasEstimate,
      gasPrice: 5
    }, options), (error, result) => {if(error) console.log(error); })

    return deployed
  }

  // Returns the source code of a contract from a directory
  loadContract(name) {
    var path = `./${name.toLowerCase()}.sol`
    return fs.readFileSync(path, 'utf8')
  }

  // Deploys a contract based on the name
  deployContract(name, options={}) {
    var source = this.loadContract(name)
    return this.createContract(source, options)
  }

}

global.interface = new Interface();

global.RoboPurchase = global.interface.deployContract('contracts/RoboPurchase', {from: acct_owner});

require('repl').start({})
