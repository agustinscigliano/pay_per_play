const PayPerPlayICO = artifacts.require("./PayPerPlayICO.sol")

module.exports = function(deployer, network, accounts) {
 const startTime = 1511823600; 
 const endTime = 1511920800;
 const rate = new web3.BigNumber(1000);
 const wallet = accounts[0];

 deployer.deploy(PayPerPlayICO, startTime, endTime, rate, wallet);
};