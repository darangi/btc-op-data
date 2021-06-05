const { Pool } = require("pg");
const { database } = require("../config");

module.exports = {
  db: new Pool(database)
}
