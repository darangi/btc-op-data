const { blockchain } = require("../utils/btc");

const getBlockChainInfo = () => {
  try {
    return blockchain([{ method: 'getblockchaininfo' }])
  }
  catch (ex) {
    console.log(ex.message);
  }
}

const getBlockHash = (blockHeight) => {
  if (!blockHeight) {
    return;
  }
  try {
    return blockchain([{ method: 'getblockhash', parameters: [parseInt(blockHeight)] }]);
  }
  catch (ex) {
  }
}

const getBlock = async (blockHash) => {
  if (!blockHash) {
    return;
  }
  try {
    const block = await blockchain([{ method: 'getblock', parameters: [blockHash, 2] }]);
    if (block.message) {
      return null
    }
    return block
  }
  catch (ex) {
    console.error(`No block found for blockHash:${blockHash}`);
  }
}

const getLastBlockHeight = () => {
  try {
    return blockchain([{ method: 'getblockcount' }]);
  }
  catch (ex) {
    console.error(`Couldn't get last block height`);
  }
}

module.exports = {
  getBlockHash,
  getBlock,
  getLastBlockHeight,
  getBlockChainInfo,
}
