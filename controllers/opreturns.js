const { formatData } = require("../utils/opreturn");
const opReturnService = require("../services/opreturn");

const getOpReturns = async (req, res) => {
  try {
    const opReturn = req.params.opReturnData;
    const page = req.query.page;
    const opReturns = await opReturnService.getOpReturns({ opReturn, page });
    if (opReturns.length === 0) {
      res.status(404).json([]);
      return;
    }
    res.json(opReturns.map(formatData));
  }
  catch (ex) {
    console.error(ex);
    res.status(500).send("An internal server error occcured");
  }
}

module.exports = {
  getOpReturns,
}
