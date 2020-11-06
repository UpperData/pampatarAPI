const express=require('express');
const router=express.Router();
const seller=require('../../controllers/seller.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

// AGREGAR MIDDLEWARE DE AUTORIZACIÓN
//router.post('/seller/add',authorization.validateToken({"id":7}),shopper.shopRequest) // Solicitud de creación de tienda



module.exports=router;
