const {add,getAll,getOne,edit}= require ('../../controllers/account.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

const express=require('express');
const router = express.Router();

// :: Account Only ::
router.get('/setting/account/list',authorization.requireRole({"id":5}),getAll); // Listar Cuentas de Usuario
router.get('/setting/account/:id',getOne); // Buscar Usuario
//router.post('/setting/account/add',add)
module.exports=router;




