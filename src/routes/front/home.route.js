const express =require ('express');
const router= express.Router();
const home=require('../../controllers/home.ctrl');
const mail=require('../../controllers/mail.ctrl');
const account=require('../../controllers/account.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');
const forceBrute=require('../../controllers/middleware/notBrute.ctrl');

router.get('/home',function(req,res){
	let now=new Date();
	res.status(200).send({
		"msj":"Bienvenido a Pampatar.cl", "date":now
	});
});

router.post('/login',forceBrute.notBruteSecure,home.singin); // Autenticación de usuario

router.post('/sing-up',forceBrute.notBruteSecure,account.add); // Resgitro de usuario

router.get('/userExists/:userName',forceBrute.notBruteSecure,home.userExist); // Valida existencia de email

router.get('/account/verify/:id',forceBrute.notBruteSecure,account.activeAccount); //Verifiacr cuenta

router.get('/account/security/:id',forceBrute.notBruteSecure,account.resetPassword); //Restarar password

router.put('/account/security',forceBrute.notBruteSecure,account.updatePassword); //Cambiar password

router.get('/geTPublicATion/GENERALviEw/:tOEekn',generals.getOneBidPreView); // Muestra un preview de publicación basado en un token

router.get('/menu',home.getAllMenu); 
router.get('/menu/cat1',home.getCat1); 
router.get('/menu/get/cat2/:cat1Id',home.getCat2); 
router.get('/menu/get/cat3/:cat2Id',home.getCat3); 
router.get('/menu/get/cat4/:cat3Id',home.getCat4); 

router.post('/account/forgot',forceBrute.notBruteSecure,account.forgotPassword ); //solicitar cambio de clave

router.post('/subscribe',forceBrute.notBruteSecure,home.subscribe); // Registra suscriptor 

router.get('/unsubscribe/:id',forceBrute.notBruteSecure,home.unsubscribe) //Crea token para unsubscribe

router.delete('/unsubscribe/:skdfdj',forceBrute.notBruteSecure,home.deleteSubscription); // elimina suscriptor

module.exports=router;
