const express=require('express');
const router=express.Router();
const shopper=require('../../controllers/shopper.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');


router.post('/shop-request',authorization.requireRole([{"id":6}]),shopper.shopRequest); // Solicitud de creación de tienda
router.get('/shop-request/shopExists/:shopName',authorization.requireRole([{"id":6}]),shopper.validateShop); // valida si existe la tienda
router.get('/shop-request/get/:id',authorization.requireRole([{"id":6},{"id":7}]),shopper.getShopRequestByStatus); // Postulaciones por estatus
router.get('/proFile/SHoppER/get/OnE/',authorization.requireRole([{"id":6}]),shopper.getShopperProfile);
router.put('/pRofile/shoppER/get/upDAte/',authorization.requireRole([{"id":6}]),shopper.updateShopperProfile);
router.put('/ACCOUNT/shOppER/uPDAte/emAIL',authorization.requireRole([{"id":6}]),shopper.updateShopperEmail);

module.exports=router;