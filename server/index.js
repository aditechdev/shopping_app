// Import Express
const express = require('express');
// Initialize the API
const app = express();
const PORT = 3000; //localHost

// Creating an API
app.listen(PORT, "0.0.0.0", () => { 
    console.log("Connect at PORT: " +PORT);
    console.log(`Connect at PORT: ${PORT}`);
} ); // If you dont put any number, It will access local host,
//Android cannot listen to local host, so we are useing here "0.0.0.0"



