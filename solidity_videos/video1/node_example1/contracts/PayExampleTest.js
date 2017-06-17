
(PayExample.owner() == acct_owner)
// Should be true

PayExample.pay(web3.toWei("1", "ether"), acct_acct2, {from: acct_acct1, value: web3.toWei("1", "ether"), gas: 300000});

PayExample.person1() == acct_acct1
PayExample.person2() == acct_acct2
web3.fromWei(PayExample.etherAmount(), "ether").toString();

interface.etherBalance(acct_owner);
interface.etherBalance(acct_acct1);
interface.etherBalance(acct_acct2);

PayExample.withdraw({from: acct_owner});

interface.etherBalance(acct_owner);

PayExample.setOwner(acct_acct1, {from: acct_owner})
(PayExample.owner() == acct_owner)
(PayExample.owner() == acct_acct1)


