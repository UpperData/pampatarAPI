const express=require('express');
const router=express.Router();
const authorization=require('../../controllers/middleware/authorization.ctrl');
const {add}= require ('../../controllers/fullAccount.ctrl');
// Agregar controlador account
/*
router.put('/account/passchange',function(req,res){

	console.log('Password Change :: Estudio Pampatar');
	res.status(200).json({"addres":"account/passChange","action":"Cambio de clave"});

});

router.put('/account/edit',function(req,res){

	console.log('Edit Account Infroamton :: Estuido Pampatar');
	res.status(200).json({"addres":"account/edit","action":"Actualización de Cuenta de usuario"});

});

router.get('/account/profile', function(req,res) {
	res.status(200).json({"address":"account/profile","action":"People profile"});
});*/
//router.post('/account/add',add)

module.exports=router;
