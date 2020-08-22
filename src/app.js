const express = require('express');
const morgan =require('morgan');
const cors =require('cors');
var helmet = require('helmet');
//setting
var app=express(); // Express Initialize
app.set('port',process.env.PORT || 4094 ); // comunication port
app.use(helmet()); //ayuda a proteger la aplicación de algunas vulnerabilidades web conocidas mediante el establecimiento correcto de cabeceras HTTP.

// Middleware
app.use(cors());
app.use(morgan('dev')); // transaction views in  'dev'  format
app.use(express.urlencoded({extended:false})); // Esto es para pode recibir datos enviados
app.use(express.json()); // for read .JSON format

// Routes

app.use(require('./routes/front/home.route'));
app.use(require('./routes/front/account.route'));
app.use(require('./routes/front/generals.route'));
//-----
app.use(require('./routes/back/account.route'));
app.use(require('./routes/back/seller.route'));
app.use(require('./routes/back/shopper.route'));
app.use(require('./routes/back/people.route'));
app.use(require('./routes/back/fullAccount.route'));
app.use(require('./routes/back/roles.route'));
app.use(require('./routes/back/bid.route'));
app.use(require('./routes/back/admin.route'));



// Start Server
app.listen(app.get('port'),function(){

	console.log('Pampatar is working in port:', app.get('port'));
	
});
