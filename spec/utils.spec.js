const { hexes, block, decodedOpreturns, opReturns } = require("./fixtures/bitcoind");
const { decodeOpReturn, extractOpMetaData } = require("../utils/opreturn")

describe("OpReturn", () => {
    it("Should extract opReturn Hex", async () => {
        const result = await extractOpMetaData(block.tx);
        expect(result.map(r => r.opReturnHex)).toMatchObject(hexes);
    })

    it("Should decode opReturns", () => {
        expect(opReturns.map(decodeOpReturn)).toMatchObject(decodedOpreturns);
    })
})
