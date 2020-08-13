const express=require('express');
const router=express.Router();
const shopper=require('../../controllers/shopper.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');


router.post('/shop-request',authorization.requireRole([{"id":16}]),shopper.shopRequest) // Solicitud de creación de tienda
//router.get('/shop-request/validBrand',home.existBrand) // valida si existe la marca

module.exports=router;