const { getBlockChainInfo, getBlockHash, getBlock, getLastBlockHeight } = require("../services/blockchain");
const { block } = require("./fixtures/bitcoind");

describe("Connection to bitcoind", () => {
  it("Should connect to local node", async () => {
    const data = await getBlockChainInfo();
    expect(data).toBeDefined();
    expect(data).toHaveProperty('headers');
  })

  it("Should retrieve a block hash", async () => {
    const hash = await getBlockHash(322000);
    expect(hash).toBeDefined();
    expect(hash).toBe(block.hash);
  })

  it("Should retrieve a block", async () => {
    const hash = await getBlockHash(322000);
    const _block = await getBlock(hash);
    expect(_block).toBeDefined();
    expect(_block.hash).toBe(block.hash);
    expect(_block.height).toBe(block.height);
  })
})
