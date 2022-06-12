const jwt = require('jsonwebtoken');

const auth = async (req, res, next) => { 
    
    try {
        const token = req.header("x-auth-token");
        console.log(token);
        if (!token) return res.status(401).json({
            msg: "No Auth token, Access denied!"
        });
        const isVerified = jwt.verify(token, 'passwordKey');
        if (!isVerified) {
            return res.status(401).json({msg: "Token Verification failed, Authorization denied!"});
        }
        req.user = isVerified.id;
        req.token = token;
        next();
        
    } catch (error) {
        return res.status(500).json({
            error: error.message
        });
        
    }

}

module.exports = auth;