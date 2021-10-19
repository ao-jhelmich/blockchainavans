const path = require('path')
module.exports = {
  contracts_build_directory: path.join(__dirname, "vapp/src/contracts"),

  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    // besuWallet: {
    //   provider: privateKeyProvider,
    //   network_id: "*"
    // },
  }
};
