
const { indexBlocks } = require("./indexblocks");
const { getLastIndexedBlockHeight } = require("../services/opreturn");
const { getLastBlockHeight } = require("../services/blockchain");

let isMonitoring = false
/**
 * Checks for new blocks added to the blockchain and indexes OP_RETURN
 */
const monitor = async () => {
  if (isMonitoring) return;
  console.log("checking for new blocks")
  try {
    isMonitoring = true;
    const lastBlockheight = await getLastBlockHeight();
    const lastIndexedBlockHeight = await getLastIndexedBlockHeight();
    if (lastBlockheight > lastIndexedBlockHeight) {
      console.log(`${lastBlockheight - lastIndexedBlockHeight} block(s) detected`);
      const successfullyIndexed = await indexBlocks(lastIndexedBlockHeight, lastBlockheight);
      console.log(`Succesfully added ${successfullyIndexed} indexes(s)`);
    }
    else {
      console.log("Zero New block(s) detected");
    }
  }
  catch (ex) {
    console.error(ex)
  }
  finally {
    isMonitoring = false
  }
}

module.exports = {
  monitor,
}
