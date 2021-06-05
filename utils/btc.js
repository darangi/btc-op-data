const Client = require("bitcoin-core");
const { rpc } = require("../config");
const client = new Client(rpc);

module.exports = {
  blockchain: (method) => {
    return new Promise((resolve, reject) => {
      client.command(method).then((result) => {
        resolve(result[0])
      })
    })
  }
}
