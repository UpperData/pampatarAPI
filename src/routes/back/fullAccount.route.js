const express=require('express');
const router=express.Router();
const fullAccount =require('../../controllers/fullAccount.ctrl');
// Get Account List
router.get('/setting/account/profile/:id',function(req,res){
	console.log('Account profile view');
	res.status(200).json({"route":"account/proflie","message":"Account profile view"});
});
/*
router.get('/setting/account/list',function(req,res){
	console.log('Profile List');
	res.status(200).json("route":"account/proflie","message":"Account profile");
});
*/
router.put('/setting/account/edit/:id',function(req,res){
	console.log('Account editing');
	res.status(200).json({"route":"account/edit","message":"Account editor"});
});

router.post('/setting/account/add',fullAccount.add); // Account Add

module.exports=router;
