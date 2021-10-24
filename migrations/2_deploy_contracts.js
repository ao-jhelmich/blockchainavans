const Flip = artifacts.require("Flip");
const ProductContract = artifacts.require("ProductContract");
const SimpleStorage = artifacts.require("SimpleStorage");

module.exports = function(deployer) {
  deployer.deploy(Flip);
  deployer.deploy(ProductContract);
  deployer.deploy(SimpleStorage);
};
