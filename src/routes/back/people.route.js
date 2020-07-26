const express=require('express');
const router=express.Router();
const {add,edit,getAll,getOne} = require ('../../controllers/people.ctrl');

router.get('/setting/people/list',getAll); // Select All People
router.get('/setting/people/:id',getOne); // Select One People
//router.post('/setting/people/add',add); // Insert People
//router.put('/setting/people/:id',edit); // Update People

module.exports=router;
