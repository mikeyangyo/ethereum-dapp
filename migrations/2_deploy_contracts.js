var SimpleStorage = artifacts.require("./SimpleStorage.sol");
var PushButton = artifacts.require("./PushButton.sol");

module.exports = function (deployer) {
  deployer.deploy(SimpleStorage);
  deployer.deploy(PushButton)
};
