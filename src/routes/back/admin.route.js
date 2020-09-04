const express=require('express');
const router=express.Router();
const sys=require('../../controllers/admin.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

router.post('/setting/seller/pre',authorization.requireRole([{"id":6},{"id":7}]), sys.preShop) // Pre-Aprobación / negación de tienda
router.post('/setting/seller/shopContract',authorization.requireRole([{"id":6},{"id":7}]), sys.shopContract) // Negación / aprobación de tienda

module.exports=router;
