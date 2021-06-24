require('dotenv').config()

const { indexBlocks } = require("./scripts/indexblocks");
const { monitor } = require("./scripts/monitorblocks");
const { blockChain } = require("./config");
const { getLastIndexedBlockHeight } = require('./services/opreturn');

(async function () {
  try {
    /**
   * Incase of a server restart, pick the last indexed blockheight and continue indexing
   */
    const lastIndexedHeight = await getLastIndexedBlockHeight();

    await indexBlocks(lastIndexedHeight || blockChain.startBlockHeight, blockChain.endBlockHeight);

    require("./scripts/server");

    setInterval(monitor, blockChain.syncInterval)
  }
  catch (ex) {
    console.log(ex.message);
  }

})()
