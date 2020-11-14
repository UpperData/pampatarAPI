const express=require('express');
const router=express.Router();
const authorization =require('../../controllers/middleware/authorization.ctrl');
const fullAccount =require('../../controllers/fullAccount.ctrl');
// Get Account List

router.post('/setting/account/add',authorization.requireRole([{"id":5},{"id":7},{"id":6}]),fullAccount.add); // Account Add

module.exports=router;
