import ProductContract from './contracts/ProductContract.json'

const options = {
  web3: {
    block: false,
    fallback: {
      type: 'ws',
      url: 'ws://127.0.0.1:9545'
    }
  },
  contracts: [
    ProductContract,
  ],
  events: {
    ProductContract: [
      'ProductAdded',
      'PaneltyAdded',
      'PaneltyPayed',
      'UserAdded',
    ]
  },
  polls: {
    accounts: 15000
  }
}

export default options
