const express=require('express');
const router=express.Router();
const authorization=require('../../controllers/middleware/authorization.ctrl');
const {add,edit,getAll,getOne} = require ('../../controllers/people.ctrl');

router.get('/setting/people/list',authorization.requireRole([{"id":6},{"id":5},{"id":7}]),getAll); // Select All People
router.get('/setting/people/:id',authorization.requireRole([{"id":6},{"id":5},{"id":7}]),getOne); // Select One People
//router.post('/setting/people/add',add); // Insert People
//router.put('/setting/people/:id',edit); // Update People

module.exports=router;
