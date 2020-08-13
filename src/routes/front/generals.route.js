const express =require ('express');
const router= express.Router();
const generals=require('../../controllers/generals.ctrl');


router.get('/docType',generals.getDocType); // All docType
router.get('/phoneType',generals.getPhoneType); // All phone type
router.get('/storeType',generals.getStoreType); // All Store type
router.get('/salesChannels',generals.getChannels); // All sales Channels
router.get('/affirmations',generals.getAffirmations); // All sales 

module.exports=router;