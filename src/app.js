
const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const db = require("./config/database")
const hostname = "0.0.0.0";
const port = 8000;

const app = express();

// Connexion à la base de données


db.connect(function(err) {
  if (err) {
    console.error("Erreur de connexion à la base de données : " + err.stack);
    return;
  }
  console.log("Connecté à la base de données avec l'ID " + db.threadId);
});

// Middleware pour parser les requêtes en JSON
app.use(bodyParser.json());

// Routes 
const userRoutes = require("./api/routes/userRoute")(app, db);
const serviceRoutes = require("./api/routes/serviceRoute")(app, db);
const tipsRoutes = require("./api/routes/tipsRoute")(app, db);


app.listen(port, hostname, function() {
  console.log(`Serveur démarré sur http://${hostname}:${port}/`);
});

