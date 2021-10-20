const Flip = artifacts.require("Flip");
const ProductContract = artifacts.require("ProductContract");

module.exports = function(deployer) {
  deployer.deploy(Flip);
  deployer.deploy(ProductContract);
};
