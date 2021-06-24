let express = require('express');
let bodyParser = require("body-parser");
let config = require("config");
let mongoose = require('mongoose');
let multer = require('multer');
let path = require('path');
let admin = require("firebase-admin");
let serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: process.env.BUCKET_URL
});

let app = express();

const uri = config.get("mongodb_uri");
mongoose.connect(uri, {useUnifiedTopology: true, useNewUrlParser: true, serverSelectionTimeoutMS: 5000});
let db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

let host = config.get("server.host");
let port = process.env.PORT || config.get("server.port");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

// set Storage upload file
// const storage = multer.diskStorage({
//     destination: './public/uploads',
//     filename(req, file, callback) {
//         callback(null, Date.now() + path.extname(file.originalname))
//     }
// });
// const upload = multer({storage: storage}).any('');;
// app.use(upload);

//sendfile image by router
app.get("/public/uploads/videos/:url", async (req, res) => {
    res.sendFile(path.join(__dirname, '/public/uploads/videos', req.params.url));
});

app.get("/public/uploads/images/:url", async (req, res) => {
    res.sendFile(path.join(__dirname, '/public/uploads/images', req.params.url));
});

//middleware
app.use((req, res, next) => {
    next();
});

const routes = require(__dirname + '/routes');
app.use(routes);

app.listen(port, host, function() {
    console.log("Sever is running on port: " , port); 
});