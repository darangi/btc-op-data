const { db } = require('../utils/db');

const itemsPerPage = 10;

const saveBlock = async ({ transactionHash, blockHash, blockHeight, opReturn, opReturnHex }) => {
  try {
    return db.query(`INSERT INTO op_returns (transaction_hash, block_hash, block_height, op_return, op_return_hex) VALUES ($1, $2, $3, $4, $5) ON CONFLICT (transaction_hash) DO NOTHING`, [transactionHash, blockHash, blockHeight, opReturn, opReturnHex]);
  }
  catch (ex) {
    throw ex.message;
  }
}

const getOpReturns = async ({ opReturn, page = 1 }) => {
  try {
    const offset = (page - 1) * itemsPerPage;
    const { rows } = await db.query("SELECT * FROM op_returns WHERE op_return= $1 OR op_return_hex= $1 LIMIT $2 OFFSET $3", [opReturn, itemsPerPage, offset]);
    return rows
  }
  catch (ex) {
    throw `Error occured while trying to search by opReturn ${opReturn} `;
  }
}

const getLastIndexedBlockHeight = async () => {
  try {
    const { rows } = await db.query(`select block_height from op_returns order by block_height desc limit 1`);
    return rows && rows.length ? rows[0].block_height : null;
  }
  catch (ex) {
    throw `Error occured while trying to retrieve last blockheight`
  }
}

module.exports = {
  saveBlock,
  getOpReturns,
  getLastIndexedBlockHeight,
}
