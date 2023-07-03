const express = require('express');
const morgan =require('morgan');
const cors =require('cors');
var helmet = require('helmet');
const https = require("https");
require('dotenv').config();
  fs = require("fs");
  const rateLimit = require("express-rate-limit");
 
// Enable if you're behind a reverse proxy (Heroku, Bluemix, AWS ELB, Nginx, etc)
// see https://expressjs.com/en/guide/behind-proxies.html 
const apiLimiter = rateLimit({ // Limite de peticiones a una ruta
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 1000 // Conexiones maximas
});
var app=express(); // Express Initialize

//setting
app.set('trust proxy', 1); // trabaja en conjunto con el limite de peticiones a las ruta
app.use(apiLimiter); // Limita conexiones
app.set('port',process.env.PORT || 4094 ); // comunication port
app.use(helmet()); //ayuda a proteger la aplicación de algunas vulnerabilidades web conocidas mediante el establecimiento correcto de cabeceras HTTP.

// Middleware
app.use(cors());
app.use(morgan('dev')); // transaction views in  'dev'  format
app.use(express.urlencoded({extended:false,limit: '2000kb'})); // Esto es para pode recibir datos enviados
app.use(express.json({limit: '1mb'})); // for read .JSON format
app.use('/inner/pampatarStatic/', express.static(__dirname +'/assets'));
// Routes

app.use(require('./routes/front/home.route'));
app.use(require('./routes/front/account.route'));
app.use(require('./routes/front/generals.route'));
app.use(require('./routes/front/shopper.route'));
//-----
app.use(require('./routes/back/account.route'));
app.use(require('./routes/back/seller.route'));
app.use(require('./routes/back/shopper.route'));
app.use(require('./routes/back/people.route'));
app.use(require('./routes/back/fullAccount.route'));
app.use(require('./routes/back/roles.route'));
app.use(require('./routes/back/bid.route'));
app.use(require('./routes/back/admin.route'));
app.use(require('./routes/back/warehouse.route'));
app.use(require('./routes/back/envoice.route'));
app.use(require('./routes/back/panel.route'));

/*const options = {
	key: fs.readFileSync(process.env.SSL_CERTIFICATE_KEY),
	cert: fs.readFileSync(process.env.SSL_CERTIFICATE) // these paths might differ for you, make sure to copy from the certbot output
	//dhparam: fs.readFileSync(process.env.DH_PARAM)
  };*/

// Start Server
app.listen(app.get('port'),function(){

	console.log('RespuestosGO is working in port:', app.get('port'));
	
});
//https.createServer(options, app).listen(8080);
