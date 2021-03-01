const express=require('express');
const router=express.Router();
const authorization=require('../../controllers/middleware/authorization.ctrl');
const bid =require('../../controllers/bid.ctrl');


router.get('/seLLer/pUBLIctIons/get/ALl',authorization.requireRole([{"id":5}]),bid.getAllMine); // Get all 
router.post('/seller/puBLIctIons/bid/aDd',authorization.requireRole([{"id":5}]),bid.addBid); // Get all from artisan

module.exports=router;