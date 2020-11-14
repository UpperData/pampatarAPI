const express=require('express');
const router=express.Router();
const authorization=require('../../controllers/middleware/authorization.ctrl');
const {add,getOne,getAll,edit}=require('../../controllers/role.ctrl');

router.get('/setting/role/list',authorization.requireRole([{"id":6},{"id":5},{"id":7}]),getAll); // Lista los roles
router.get('/setting/role/view/:id',authorization.requireRole([{"id":6},{"id":5},{"id":7}]),getOne); // Consulta un role
router.post('/setting/role/add',authorization.requireRole([{"id":6},{"id":5},{"id":7}]),add); //Agrega un role
router.put('/setting/role/edit',authorization.requireRole([{"id":6},{"id":5},{"id":7}]),edit); //Modificar Role

module.exports=router;
