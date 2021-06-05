const { blockchain } = require("../utils/btc");

const getBlockChainInfo = () => {
  try {
    return blockchain([{ method: 'getblockchaininfo' }])
  }
  catch (ex) {
    console.log(ex.message);
    console.error(`no blockchain Info found`);

  }
}

const getBlockHash = (blockHeight) => {
  if (!blockHeight) {
    console.error(`No blockHeight provided`);
    return;
  }
  try {
    return blockchain([{ method: 'getblockhash', parameters: [parseInt(blockHeight)] }]);
  }
  catch (ex) {
    console.error(`No blockInfo found for blockHeight:${blockHeight}`);
  }
}

const getBlock = async (blockHash) => {
  if (!blockHash) {
    console.error(`No hash provided`);
    return;
  }
  try {
    const block = await blockchain([{ method: 'getblock', parameters: [blockHash, 2] }]);
    if (block.message) {
      console.log(block.message)
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
