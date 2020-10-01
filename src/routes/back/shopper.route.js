const express=require('express');
const router=express.Router();
const shopper=require('../../controllers/shopper.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');


router.post('/shop-request',authorization.requireRole([{"id":6}]),shopper.shopRequest) // Solicitud de creación de tienda
router.get('/shop-request/shopExists/:shopName',shopper.validateShop) // valida si existe la tienda

module.exports=router;