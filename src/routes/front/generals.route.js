const express =require ('express');
const router= express.Router();
const generals=require('../../controllers/generals.ctrl');


router.get('/docType',generals.getDocType); // All docType
router.get('/phoneType',generals.getPhoneType); // All phone type
router.get('/storeType',generals.getStoreType); // All Store type
router.get('/salesChannels',generals.getChannels); // All sales Channels
router.get('/affirmations',generals.getAffirmations); // All sales 
router.get('/nationalities',generals.getNationality); // All sales 
router.get('/genders',generals.getGender); // All sales 
router.get('/docByPeopleType/:peopleTypeId',generals.getDocTypeByPeopleType); // Document by People Type
router.get('/peopleType',generals.getPeopleType) // Tipos de perosona
router.get('/regions',generals.getRegion) // Regiones de Chile
router.get('/provinces/:regionId',generals.getProvince) // Provinces of region Chile

module.exports=router;