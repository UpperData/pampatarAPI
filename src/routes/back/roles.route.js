const express=require('express');
const router=express.Router();
const {add,getOne,getAll,edit}=require('../../controllers/role.ctrl');

router.get('/setting/role/list',getAll); // Lista los roles
router.get('/setting/role/view/:id',getOne); // Consulta un role
router.post('/setting/role/add',add); //Agrega un role
router.put('/setting/role/edit',edit); //Modificar Role

module.exports=router;
