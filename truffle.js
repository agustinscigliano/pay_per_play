var HDWalletProvider = require("truffle-hdwallet-provider");

var infura_apikey = "3zxxgIUG8QdF9cKWbLQP";
var mnemonic = "oyster cushion knee inspire mom flat budget kiwi december upon opera wonder";

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      gas: 4700036,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey),
      gas: 4704036,
      network_id: 3
    }
  }
};
