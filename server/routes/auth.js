const express = require("express");
const User = require("../models/user");

const authRouter = express.Router();

// API
authRouter.post("/api/signup", async (req, res) => { 

    try {
         // Get Data 
    const { name, email, password } = req.body;
    // TO check existing user with same email id
    const existingUser = await User.findOne({ email });

    if (existingUser) {
        return res.status(400).json({
            msg: "User with same email already exist!"
        });
        
    }

    let user = new User({
        email,
        password,
        name,
    })

    // save the data 
    user = await user.save();
    // Return that Data to client
    res.json(user)
        
    } catch (error) {
        res.status(500).json({
            error: error.message
        })
        
    }

   ;

    
})
// Exports the Route
module.exports = authRouter;