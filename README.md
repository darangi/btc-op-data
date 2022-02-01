# Description
**A minimal command line tool to index and store op_return data from the btc blockchain.** [what is op_return?](https://bitcoin.stackexchange.com/questions/29554/explanation-of-what-an-op-return-transaction-looks-like)

It consists of two parts:
- Scans ``op_return`` data from the connected bitcoin node(testnet/mainnet), and stores them in a postgres database
- Then the indexed `op_return` data could be queried to return the associated transaction and blockhash.


## Prerequisites
* **NodeJS** (v10 or v12).
* **bitcoind**. A running bitcoin node with JSON-RPC.
* Posgresql db

## Start the app
- create an `.env` file based off `.env.example` in the root
- npm install
- npm start

## Run tests
- npm run test

## Migrations
- npm run migrate
