const express=require('express');
const router=express.Router();
const shopper=require('../../controllers/shopper.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');
const forceBrute=require('../../controllers/middleware/notBrute.ctrl');

router.get('/shop-request/vIew/:id',forceBrute.notBruteSecure,shopper.shopRequestView) // Solicitud de creación de tienda
router.get('/shoppeR/chANgemail/:tokenUpdate',forceBrute.notBruteSecure,shopper.accountEmailUpdate) // Solicitud de creación de tienda

//router.get('/shop-request/validBrand',home.existBrand) // valida si existe la marca

module.exports=router;
