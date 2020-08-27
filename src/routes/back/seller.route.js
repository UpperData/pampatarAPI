const express=require('express');
const router=express.Router();
const authorization =require('../../controllers/middleware/authorization.ctrl');
const seller=require('../../controllers/seller.ctrl');


//router.get('/bids',seller.shopRequest) // Solicitud de creación de Publicación
//router.post('/bids/add',seller.shopRequest) // Solicitud de creación de tienda
//router.put('/bids/:id',seller.shopRequest) // Solicitud de creación de tienda
<<<<<<< Updated upstream
//router.put('/bids/status',seller.status) // Solicitud de creación de tienda
router.get('/shop/config',authorization.requireRole([{"id":5}]),seller.getShop); // consulta 
router.put('/shop/config',authorization.requireRole([{"id":5}]),seller.edit); // consulta 
=======
//router.post('/bids/add',seller.status) // Registrar publicación
router.get('/bids/search/:id',authorization.requireRole([{"id":5}]),seller.getBidOne) // trae una publicación del vendedor
router.get('/bids/all',authorization.requireRole([{"id":5}]),seller.getBidAll) // trae todas publicación del vendedor
router.get('/shop/config',authorization.requireRole([{"id":5}]),seller.getShop); // Consultar tienda
router.put('/shop/config',authorization.requireRole([{"id":5}]),seller.configShop); // Configurar Tienda 
router.post('/bids/add',authorization.requireRole([{"id":5}]),seller.addBid); // Agregar una publicación

>>>>>>> Stashed changes


module.exports=router;