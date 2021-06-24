let express = require("express");

const router = express.Router();

router.use("/apis/cinema", require(__dirname + "/apis"));

module.exports = router;