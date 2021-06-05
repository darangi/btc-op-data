require('dotenv').config()

module.exports = {
  database: {
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT
  },
  server: {
    port: process.env.PORT || 8080,
  },
  blockChain: {
    startBlockHeight: process.env.START_BLOCK_HEIGHT || 322000,
    endBlockHeight: process.env.END_BLOCK_HEIGHT || 322100,
    syncInterval: process.env.SYNC_INTERVAL || 10000,
  },
  rpc: {
    username: process.env.RPC_USER,
    password: process.env.RPC_PASSWORD,
    host: "localhost",
    network: process.env.RPC_NEWORK || 'testnet',
  }
}
