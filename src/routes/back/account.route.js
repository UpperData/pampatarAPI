const account= require ('../../controllers/account.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl');

const roleAccount =require ('../../controllers/accountRoles.ctrl');

const express=require('express');
const router = express.Router();

// :: Account Only ::
//router.get('/setting/account/list',authorization.requireRole({"id":5}),getAll); // Listar Cuentas de Usuario
router.get('/setting/account/:id',account.getOne); // Buscar Usuario
router.put('/setting/updatePass/',authorization.requireRole([{"id":5},{"id":7},{"id":6}]),account.changePassword); // Buscar Usuario
router.get('/boLogin/:token',authorization.requireRole([{"id":5},{"id":7},{"id":6}]),account.loginToken); // autenticación por token
//router.get('/setting/account/list',authorization.requireRole({"id":5}),getAll); // Listar Cuentas de Usuario

//router.post('/setting/account/add',add)
module.exports=router;




