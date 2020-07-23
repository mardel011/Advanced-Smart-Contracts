const LongLivedPaymentChannel = artifacts.require("LongLivedPaymentChannel");

module.exports = function(deployer,network,accounts) {
  deployer.deploy(LongLivedPaymentChannel,accounts[0],web3.utils.toBN(200));
};
