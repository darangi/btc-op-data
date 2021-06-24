const extractOpMetaData = async (transactions) => {
  try {
    let result = [];
    transactions.forEach(transaction => {
      if (!transaction.vout) {
        continue;
      }

      const data = transaction.vout.find(output => output.scriptPubKey.type === 'nulldata');

      if (data) {
        result.push({
          opReturnHex: data.scriptPubKey.hex,
          opReturn: data.scriptPubKey.asm.split(' ')[1] || data.scriptPubKey.hex,
          transactionHash: transaction.hash
        })
      }
    })
    return result;
  }
  catch (ex) {
    console.log(ex.message);
  }
}

const formatData = (data) => {
  const op_return_decoded = decodeOpReturn(data.op_return);
  return { ...data, op_return_decoded };
}
const decodeOpReturn = (opReturn) => {
  return Buffer.from(opReturn, 'hex').toString();
}

module.exports = {
  extractOpMetaData,
  formatData,
  decodeOpReturn,
}
