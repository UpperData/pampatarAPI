const express=require('express');
const router=express.Router();
const shopper=require('../controller/seller.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

// AGREGAR MIDDLEWARE DE AUTORIZACIÓN
router.post('/seller/add',authorization.validateToken({"id":7}),shopper.shopRequest) // Solicitud de creación de tienda

//router.get('/shop-request/validBrand',home.existBrand) // valida si existe la marca

module.exports=router;
