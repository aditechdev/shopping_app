//! Import From Package
const express = require('express');
//! Import from File
const authRouter = require('./routes/auth');

// Init
const app = express();
const PORT = 3000; //localHost


//! MiddleWare
//! Client -> Server -> Clinet
app.use(authRouter);

app.listen(PORT,  () => { 
    console.log("Connect at PORT: " +PORT);
    console.log(`Connect at PORT: ${PORT}`);
} ); // If you dont put any number, It will access local host,
//Android cannot listen to local host, so we are useing here "0.0.0.0"



