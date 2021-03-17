const express =require ('express');
const router= express.Router();
const generals=require('../../controllers/generals.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');
fs = require('fs');
const path = require('path');

router.get('/docType',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getDocType); // All docType
router.get('/phoneType',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getPhoneType); // All phone type
router.get('/storeType',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getStoreType); // All Store type
router.get('/salesChannels',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getChannels); // All sales Channels
router.get('/affirmations',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getAffirmations); // All sales 
router.get('/nationalities',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getNationality); // All sales 
router.get('/genders',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getGender); // All sales 
router.get('/docByPeopleType/:peopleTypeId',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getDocTypeByPeopleType); // Document by People Type
router.get('/peopleType',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getPeopleType) // Tipos de perosona
router.get('/regions',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getRegion) // Regiones de Chile
router.get('/provinces/:regionId',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getProvince) // Provinces of region Chile
router.get('/comuna/:provinceId',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getComuna) // Comuna of provinces Chile
router.get('/addressType',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getAddrTypes) // 
router.get('/getbanks',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.bank) // lista de bancos
router.get('/getTypeBankAccount',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getTypeBankAccount) // lista de TIPOS DE CUENTA
router.get('/getTypeProduction',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.processType) // lista de TIPOS DE PROCESOS DE PRODUCCIÓN
router.get('/getSize/all/generals/',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getSize) // lista de medidas
router.get('/getService/type/generals/',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.serviceType) // lista de tipos de servicios
router.get('/getPriceCurrent/Inventory/sku/:skuId/:type',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.currentPriceProduct) // Precio Actual
router.get('/getWeek/generalsDays/',authorization.requireRole([{"id":5},{"id":6},{"id":7}]),generals.getDays) // Weeek days
router.get('/taxes/admin/tax/getAll/',authorization.requireRole([{"id":5},{"id":6},{"id":7}]), generals.getTax) // todos los impuestos 
router.get('/taxes/admin/tax/get/oNE/:taxId',authorization.requireRole([{"id":5},{"id":6},{"id":7}]), generals.getTaxOne) // Un los impuestos 
router.get('/status/gEt/valUeS/STusALL/',authorization.requireRole([{"id":5},{"id":6},{"id":7}]), generals.getStatus) // Retonar los estatus  Activo / Inactivo
router.get('/sKU/types/get',authorization.requireRole([{"id":5},{"id":6},{"id":7}]), generals.skuType) // Get SKU Types
router.get('/sKU/inventOry/avaIlabLe/gET/:bidType/:bidTypeId',authorization.requireRole([{"id":5},{"id":6},{"id":7}]), generals.skuInInventory) // Get SKU Types
router.get('/sETTiNG/SHOp/statUs/SHOP/:shopId',authorization.requireRole([{"id":7}]), generals.ShopStatusGeneral); // Shop Status
router.get('/braNDS/GET/alL',authorization.requireRole([{"id":5},{"id":6},{"id":7}]), generals.getBrands); // Get Brands
router.get('/DispONIBility/GET/alL',authorization.requireRole([{"id":5},{"id":6},{"id":7}]), generals.getDisponibility); // Get Disponibilities
router.get('/geTpuBLIcATion/TYpE/all',authorization.requireRole([{"id":5},{"id":7},{"id":8}]),generals.getBidTypes); 
router.get('/maTerialS/GeT/BId/',authorization.requireRole([{"id":5},{"id":6},{"id":7}]), generals.getMaterials); // Get Disponibilities
module.exports=router;