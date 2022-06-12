const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");

const authRouter = express.Router();

//! Sign UP API
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
    const hashedPassword =   await  bcryptjs.hash(password, 8);

    let user = new User({
        email,
        password: hashedPassword,
        name,
    })

    // save the data 
    user = await user.save();
    // Return that Data to client
        res.json(user);
        
    } catch (error) {
        res.status(500).json({
            error: error.message
        })
        
    };
})

//! Sign In Route

authRouter.post("/api/signin", async (req, res) => { 

    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        if (!user) { 
            return res.status(400).json({ msg: "User with this email, does not exist" });
        }
        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect Password" });
        }
        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, ...user._doc });
        
    } catch (error) {
        res.status(500).json({ error: e.message });
        
    }
});

//! Verif jwt Token
authRouter.post("/isTokenValid", async (req, res) => { 

    try {
        const token = req.header("x-auth-token");
        if (!token) return res.json(false);    
        

        const isVerified = jwt.verify(token, 'passwordKey');
        if (!isVerified) return res.json(false);
        const user = await User.findById(isVerified.id);
        if (!user) return res.json(false);
        res.json(true);
        
    } catch (error) {
        console.log(error);
        res.status(500).json({ error: e.message });
        
    }
});

//! get User Data

authRouter.get('/', auth, async (req, res) => { 

    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });

});
// Exports the Route
module.exports = authRouter;