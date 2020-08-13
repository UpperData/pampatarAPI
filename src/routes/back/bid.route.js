const express=require('express');
const router=express.Router();
const autorization=require('../../controllers/middleware/authorization.ctrl');
const bid =require('../../controllers/bid.ctrl');


router.get('/artisan/bid/:id',bid.getOne); // Get One 
router.get('/artisan/bid/',bid.getAllMine); // Get all from artisan
router.post('/setting/artisan/bid/',bid.add); // Add One 
router.put('/setting/artisan/bid/:id',bid.edit); // edit
module.exports=router;