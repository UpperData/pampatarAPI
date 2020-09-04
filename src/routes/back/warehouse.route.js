const express=require('express');
const router=express.Router();
const warehouse=require('../../controllers/warehouse.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

router.post('/warehouse',authorization.requireRole([{"id":6}]),warehouse.add) // crear un almacen


module.exports=router;