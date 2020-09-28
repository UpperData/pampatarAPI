const express =require ('express');
const router= express.Router();
const authorization =require('../../controllers/middleware/authorization.ctrl');
const panel=require('../../controllers/panel.ctrl');
router.get('/admin-panel/:role',authorization.requireRole([{"id":5},{"id":7}]),panel.getAllPanel); // Panel del BackOffice

module.exports=router;