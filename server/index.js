// Import Express
const express = require('express');
// Initialize the API
const app = express();
const PORT = 3000; //localHost

// Creating an API
// https://<your Ip Adress>/hello-world
// Get Put Post Delete Update  => Crude
// !Example of API
// ! Example 1
// app.get("/hello-world", (req, res) => { 
//     // res.send("hello world");
//     res.json({ "hi": "Hellow Meaow" });

// }); 
// !Example 2
// app.get("/", (req, res) => { 

//     res.json({
//         "name": "Aditya"
//     });
// })

app.listen(PORT,  () => { 
    console.log("Connect at PORT: " +PORT);
    console.log(`Connect at PORT: ${PORT}`);
} ); // If you dont put any number, It will access local host,
//Android cannot listen to local host, so we are useing here "0.0.0.0"



