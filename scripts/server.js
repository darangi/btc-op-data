const express = require("express");
const app = express();
const { server } = require("../config");
const { getOpReturns } = require("../controllers/opreturns");

app.use("/opReturn/:opReturnData", getOpReturns);

app.listen(server.port, () => {
  console.log(`Server running on ${server.port}`);
});
