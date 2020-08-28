const express=require('express');
const router=express.Router();
const sys=require('../../controllers/admin.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

// AGREGAR MIDDLEWARE DE AUTORIZACIÓN
router.post('/setting/seller/pre',authorization.requireRole([{"id":6},{"id":7}]), sys.preShop) // Solicitud de creación de tienda

module.exports=router;
