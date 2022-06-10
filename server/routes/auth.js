const express = require("express");

const authRouter = express.Router();
// API
authRouter.post("/api/signup", (req, res) => { 

    // Get Data 
    const {name, email, password} = req.body;

    // Post Data in database

    // Return that Data to client
})
// Exports the Route
module.exports = authRouter;