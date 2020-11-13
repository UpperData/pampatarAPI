const express=require('express');
const router=express.Router();
const sys=require('../../controllers/admin.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

router.post('/setting/seller/pre',authorization.requireRole([{"id":7}]), sys.preShop) // Pre-Aprobación / negación de tienda
router.post('/setting/seller/shopContract',authorization.requireRole([{"id":7}]), sys.shopContract) // Negación / aprobación de tienda
router.get('/setting/seller/shoptRequest',authorization.requireRole([{"id":7}]), sys.getShopRequestInEvaluation) // Postulaciones En Evaluación
router.get('/setting/seller/shoptRequest-pre',authorization.requireRole([{"id":7}]), sys.getShopRequestPreAproved) // Postulaciones pre-aprobada
router.get('/setting/seller/contract/shop/:shopId',authorization.requireRole([{"id":7}]), sys.getContractByShop) // Postulaciones pre-aprobada

module.exports=router;
