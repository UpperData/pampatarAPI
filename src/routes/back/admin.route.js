const express=require('express');
const router=express.Router();
const sys=require('../../controllers/admin.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

router.post('/setting/seller/pre',authorization.requireRole([{"id":7}]), sys.preShop); // Pre-Aprobación negación de tienda
router.post('/setting/seller/shopContract',authorization.requireRole([{"id":7}]), sys.shopContract); // Negación aprobación de tienda
router.get('/setting/seller/shoptRequest',authorization.requireRole([{"id":7}]), sys.getShopRequestInEvaluation); // Postulaciones En Evaluación
router.get('/setting/seller/shoptRequest-pre',authorization.requireRole([{"id":7}]), sys.getShopRequestPreAproved); // Postulaciones pre-aprobada
router.get('/setting/seller/contract/shop/:shopId',authorization.requireRole([{"id":7}]), sys.getContractByShop); // 
router.get('/setting/seller/shop/all',authorization.requireRole([{"id":7}]), sys.getShopAll); // Todas las tiendas
router.get('/setting/seller/shop/name/like/:nShop',authorization.requireRole([{"id":7}]), sys.getShopByName); // Todas las tiendas
router.get('/setting/seller/shop/general/profile/:shopId',authorization.requireRole([{"id":7}]), sys.getProfileShop); // Todas prefil de la tienda
router.put('/setting/taxes/admin/tax/update/',authorization.requireRole([{"id":7}]), sys.taxUpdate); // actualizar impuesto
router.get('/setting/taxes/admin/tax/get/currents/',authorization.requireRole([{"id":7}]), sys.getTaxCurrents); // impuestos Actuales
router.get('/setting/taxes/admin/tax/HistOry/get/:taxId',authorization.requireRole([{"id":7}]), sys.getTaxHistory); // tax history
router.get('/setting/SHoPrequests/admin/',authorization.requireRole([{"id":7}]), sys.getShopRequestAll); // trae todas las postulaciones
router.put('/setting/shOPContract/Admin',authorization.requireRole([{"id":7}]), sys.editShopContract); // trae todas las postulaciones
router.get('/setting/shOPContract/GETstAtus/:StatusId',authorization.requireRole([{"id":7}]), sys.getShopByContractStatus); // trae todas los contratos por status
router.put('/sEtting/shOP/stAtus/DISABle',authorization.requireRole([{"id":7}]), sys.shopDisable); // Shop Disable
router.put('/sEttING/sHOp/statUs/EnaBLe',authorization.requireRole([{"id":7}]), sys.shopEnable); // Shop enable
router.get('/sEtTiNg/biD/IN/evaLUAtion',authorization.requireRole([{"id":7}]), sys.bidInEvaluation); // get bids in evaluation
router.put('/SETTiNG/BiD/UpBid/APPROve',authorization.requireRole([{"id":7}]), sys.bidApprove); // Aprobar publicación
router.put('/SetTiNG/BiD/UPBid/rJeCT',authorization.requireRole([{"id":7}]), sys.bidReject); // Rechazar publicación
router.get('/SeTtiNG/BiD/get/BySHOp/:shopId',authorization.requireRole([{"id":7}]), sys.getAllBidByShop); // 
router.get('/sETTiNG/BID/ApProvate/upDATE/:shopId/:bidId',authorization.requireRole([{"id":7}]), sys.getBidUpdateRequestApproved); // Aprobar modificación de publicación
router.get('/sEtTiNG/bID/ActiVaTE/:bidId/:shopId',authorization.requireRole([{"id":7}]), sys.bidActiveAdmin); // Activar publicación
router.get('/SEtTInG/biD/REVOKE/:bidId/:shopId',authorization.requireRole([{"id":7}]), sys.bidRejectAdmin); // Dar de baja publicación
router.get('/SEtTInG/SELLER/resQUEST/UPdAtE/list',authorization.requireRole([{"id":7}]), sys.getBidUpdateRequestList); // LIstar solicitudes de actualizacin de publicaciones
router.get('/Get/ACTIvE/AccOUNTS/',authorization.requireRole([{"id":7}]), sys.getActiveAccount); // Retorna cuantas activas
router.get('/GEt/AcTIvE/accOUNtS/roLe/:RoleId',authorization.requireRole([{"id":7}]), sys.getActiveAccountByRole); // cuantas activas de un rol
router.get('/GEt/AcTIvE/roLe/',authorization.requireRole([{"id":7}]), sys.getActiveRole); // Roles activas de un rol
router.get('/settinG/biD/REJECT/UpDATe/:shopId/:bidId',authorization.requireRole([{"id":7}]), sys.getBidUpdateRequestReject); // Rechaza modificación de publicación
router.post('/send/maSive/NOtiFiCATions/',authorization.requireRole([{"id":7}]),sys.sendNotificationsToGroup);// envio de notificaciones  masivas
router.post('/SnED/MAIL/',authorization.requireRole([{"id":7}]), sys.sendEmail);
router.post('/SEND/MAIL/bY/gROUP/',authorization.requireRole([{"id":7}]), sys.sendEmailToRoleGroup);
router.get('/GET/AccoUNT/by/NAME/:name/:roleId',authorization.requireRole([{"id":7}]),sys.getActiveAccountByName);// Leer notificaciones 
router.get('/Get/ADmIN/dasHBoard/data',authorization.requireRole([{"id":7}]),sys.dataInventoryAdmin);// retorna informacion del dashboard adminsitrador 
router.get('/gEt/admin/nOtIfIcAtIoNs/HISTORY',authorization.requireRole([{"id":7}]),sys.getNotificationsHistory); //Historial de notificaciones

module.exports=router;