const express=require('express');
const router=express.Router();
const authorization =require('../../controllers/middleware/authorization.ctrl');
const seller=require('../../controllers/seller.ctrl');


//router.get('/bids',seller.shopRequest) // Solicitud de creación de Publicación
//router.post('/bids/add',seller.shopRequest) // Solicitud de creación de tienda
//router.put('/bids/:id',seller.shopRequest) // Solicitud de creación de tienda
//router.put('/bids/status',seller.status) // Solicitud de creación de tienda
router.get('/shop/config',authorization.requireRole([{"id":5}]),seller.getShop); // consulta 
router.put('/shop/config',authorization.requireRole([{"id":5}]),seller.edit); // consulta 


module.exports=router;