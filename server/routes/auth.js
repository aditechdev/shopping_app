const express = require("express");

const authRouter = express.Router();
// API
authRouter.get("/user", (req, res) => { 

    res.json({

        "msg": "Aditya "
    });
})
// Exports the Route
module.exports = authRouter;