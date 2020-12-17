const express=require('express');
const router=express.Router();
const sys=require('../../controllers/admin.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

router.post('/setting/seller/pre',authorization.requireRole([{"id":7}]), sys.preShop) // Pre-Aprobación / negación de tienda
router.post('/setting/seller/shopContract',authorization.requireRole([{"id":7}]), sys.shopContract) // Negación / aprobación de tienda
router.get('/setting/seller/shoptRequest',authorization.requireRole([{"id":7}]), sys.getShopRequestInEvaluation) // Postulaciones En Evaluación
router.get('/setting/seller/shoptRequest-pre',authorization.requireRole([{"id":7}]), sys.getShopRequestPreAproved) // Postulaciones pre-aprobada
router.get('/setting/seller/contract/shop/:shopId',authorization.requireRole([{"id":7}]), sys.getContractByShop) //
router.get('/setting/seller/shop/all',authorization.requireRole([{"id":7}]), sys.getShopAll) // Todas las tiendas
router.get('/setting/seller/shop/name/like/:nShop',authorization.requireRole([{"id":7}]), sys.getShopByName) // Todas las tiendas
router.get('/setting/seller/shop/general/profile/:shopId',authorization.requireRole([{"id":7}]), sys.getProfileShop) // Todas prefil de la tienda
router.put('/setting/taxes/admin/tax/update/',authorization.requireRole([{"id":7}]), sys.taxUpdate) // actualizar impuesto
router.get('/setting/taxes/admin/tax/get/currents/',authorization.requireRole([{"id":7}]), sys.getTaxCurrents) // impuestos Actuales


module.exports=router;
