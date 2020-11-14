const express=require('express');
const router=express.Router();
const authorization=require('../../controllers/middleware/authorization.ctrl');
const bid =require('../../controllers/bid.ctrl');


router.get('/artisan/bid/:id',authorization.requireRole([{"id":5},{"id":7}]),bid.getOne); // Get One 
router.get('/artisan/bid/',authorization.requireRole([{"id":5},{"id":7}]),bid.getAllMine); // Get all from artisan
router.post('/setting/artisan/bid/',authorization.requireRole([{"id":5},{"id":7}]),bid.add); // Add One 
router.put('/setting/artisan/bid/:id',authorization.requireRole([{"id":5},{"id":7}]),bid.edit); // edit
module.exports=router;