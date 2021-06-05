require('dotenv').config()

const { indexBlocks } = require("./scripts/indexblocks");
const { monitor } = require("./scripts/monitorblocks");
const { blockChain } = require("./config");
const { getLastIndexedBlockHeight } = require('./services/opreturn');

getLastIndexedBlockHeight().then(lastIndexedHeight => {
  if (lastIndexedHeight) {
    console.log(`Last indexed block height ${lastIndexedHeight}`);
  }
  indexBlocks(lastIndexedHeight || blockChain.startBlockHeight, blockChain.endBlockHeight)
    .then(successfullyIndexed => {
      console.log(successfullyIndexed > 0 ? `Indexing completed: ${successfullyIndexed} OP_RETURN(s) indexed` : `Indexing completed`);
      require("./scripts/server");
    }).then(() => {
      setInterval(monitor, blockChain.syncInterval)
    })
    .catch(ex => {
      console.error(ex.message || ex)
    })
})
