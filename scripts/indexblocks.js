const { getBlock, getBlockHash, getLastBlockHeight } = require("../services/blockchain");
const { saveBlock } = require("../services/opreturn")
const { extractOpMetaData } = require("../utils/opreturn");
/**
 * Retrieves and indexes OP_RETURN data for specified block ranges
 * @param {number} startBlockHeight 
 * @param {number} endBlockHeight 
 */
const indexBlocks = (startBlockHeight, endBlockHeight) => {
  return new Promise(async (resolve, reject) => {
    if (startBlockHeight > endBlockHeight) {
      return resolve(0);
    };
    console.log("indexing opreturns...");
    try {
      let successfullyIndexed = 0;
      endBlockHeight = endBlockHeight || await getLastBlockHeight();
      for (let blockHeight = startBlockHeight; blockHeight <= endBlockHeight; blockHeight++) {
        try {
          const hash = await getBlockHash(blockHeight);
          if (!hash) {
            console.log(`No hash found for block height ${blockHeight}`);
            continue;
          }
          const block = await getBlock(hash);
          if (!block) {
            console.log(`No block found for block hash ${hash}`);
            continue;
          }
          const data = await extractOpMetaData(block.tx)
          if (data.length) {
            for (const { transactionHash, opReturnHex, opReturn } of data) {
              await saveBlock({ transactionHash, blockHash: block.hash, blockHeight: block.height, opReturn, opReturnHex })
              successfullyIndexed++;
            }
          }
        }
        catch (ex) {
          console.error(`Error indexing block height:${blockHeight}, ${ex}`);
        }
      }
      resolve(successfullyIndexed);
    }
    catch (ex) {
      reject(ex.message)
    }
  })
}

module.exports = {
  indexBlocks,
}
