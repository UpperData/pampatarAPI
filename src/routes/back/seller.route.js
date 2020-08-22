const express=require('express');
const router=express.Router();
const authorization =require('../../controllers/middleware/authorization.ctrl');
const seller=require('../../controllers/seller.ctrl');




//router.put('/bids/:id',seller.shopRequest) // Solicitud de creación de tienda
//router.post('/bids/add',seller.status) // Registrar publicación
router.get('/bids/search/:id',seller.getBidOne) // trae una publicación del vendedor
router.get('/bids/all',seller.getBidAll) // trae todas publicación del vendedor
router.get('/shop/config',authorization.requireRole([{"id":5}]),seller.getShop); // Consultar tienda
router.put('/shop/config',authorization.requireRole([{"id":5}]),seller.configShop); // Configurar Tienda 
router.post('/bids/add',authorization.requireRole([{"id":5}]),seller.addBid); // Agregar una publicación



module.exports=router;