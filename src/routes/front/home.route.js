const express =require ('express');
const router= express.Router();
const home=require('../../controllers/home.ctrl');
const mail=require('../../controllers/mail.ctrl');
const account=require('../../controllers/account.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

router.get('/home',function(req,res){
	let now=new Date();
	res.status(200).send({
		"msj":"Bienvenido a Estudio Pampatar", "date":now
	});
});

router.post('/login',home.singin); // Autenticación de usuario

router.post('/sing-up',account.add); // Resgitro de usuario

router.get('/userExists/:userName',home.userExist); // Valida existencia de email

router.get('/account/verify/:id',account.activeAccount); //Verifiacr cuenta

router.get('/account/security/:id',account.resetPassword); //Restarar password

router.put('/account/security',account.updatePassword); //Cambiar password

//router.post('/register/post'); // Registra una publicación



router.post('/account/forgot',account.forgotPassword ); //solicitar cambio de clave

router.post('/subscribe',home.subscribe) // Registra suscriptor 

//router.get('/unsubscribe/:id',home.unsubscribe) //Crea token para unsubscribe

router.delete('/unsubscribe/:skdfdj',home.deleteSubscription) // elimina suscriptor



module.exports=router;
