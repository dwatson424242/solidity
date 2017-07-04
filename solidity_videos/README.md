# Solidity Videos

* video1/ - Raw, unscripted walkthrough of building a simple solidity demo https://www.youtube.com/watch?v=FpW56TaWirg
* Jordan Leigh's Video Series

	* https://www.youtube.com/watch?v=8jI1TuEaTro - Intro to Ethereum Smart Contract Development Part1
		* Truffle: https://www.youtube.com/watch?v=8jI1TuEaTro&t=16m00s
	* https://www.youtube.com/watch?v=3-XPBtAfcqo - Intro to Ethereum Smart Contract Development Part2
	* http://decypher.tv - Jordan's full Ehtereum video series for sale. (some for free)
	* https://www.youtube.com/watch?v=cakc2mirxfk - Contract Patterns & Security

* Ethereum-JS Development
	* How to contribute to Ethereum-JS - https://www.youtube.com/watch?v=L0BVDl6HZzk



* Truffle Development
	* https://youtu.be/MskZ3oSpgzA - Presentation on Truffle
	* https://www.youtube.com/watch?v=8jI1TuEaTro&t=16m00s - Jordan's Truffle Section

* Truffle Notes:
```
> mkdir truffle_test
> cd truffle_test
> truffle init
> vim contracts/Example.sol
> truffle compile
> vim migrations/2_deploy_contracts.js
> truffle migrate
> truffle console
> truffle migrate --reset
```

### 2_deploy_contracts.js
```javascript
var Example = artifacts.require("./Example.sol");
module.exports = function(deployer) {
  deployer.deploy(Example);
};
```

### Truffle Console
```javascript
> var example = Example.deployed();
> example.balance.call().then(console.log);
> web3.eth.accounts 
```
