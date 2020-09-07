const express=require('express');
const router=express.Router();
const envoice=require('../../controllers/envoce.ctrl');
const authorization =require('../../controllers/middleware/authorization.ctrl'); //Autiruzación para la ruta


router.post('/seller/envoice/notify',authorization.requireRole([{"id":5},{"id":6},{"id":7}]), envoice.notify) // Notificación de boleta

module.exports=router;