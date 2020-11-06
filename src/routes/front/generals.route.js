const express =require ('express');
const router= express.Router();
const generals=require('../../controllers/generals.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');


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


module.exports=router;