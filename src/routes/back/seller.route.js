const express=require('express');
const router=express.Router();
const authorization =require('../../controllers/middleware/authorization.ctrl');
const seller=require('../../controllers/seller.ctrl');




//router.put('/bids/:id',seller.shopRequest) // Solicitud de creación de tienda
//router.post('/bids/add',seller.status) // Registrar publicación
router.get('/bids/search/:id',authorization.requireRole([{"id":5}]),seller.getBidOne) // trae una publicación del vendedor
router.get('/bids/all',authorization.requireRole([{"id":5}]),seller.getBidAll) // trae todas publicación del vendedor
router.put('/shop/config',authorization.requireRole([{"id":5}]),seller.configShop); // Configurar Tienda 
router.post('/bids/add',authorization.requireRole([{"id":5}]),seller.addBid); // Agregar una publicación
router.post('/sku/add',authorization.requireRole([{"id":5}]),seller.addSKU); // Agregar una SKU 
router.put('/sku/edit',authorization.requireRole([{"id":5}]),seller.editSKU); // Agregar una SKU 
router.get('/sku/myList',authorization.requireRole([{"id":5}]),seller.mySKUlist); // Listar SKU por tienda
router.post('/inventory',authorization.requireRole([{"id":5}]),seller.inventoryAll); // Ingreso o salida de inventario
router.get('/getValidShopUpdate',seller.validateIsShopUpdate) // COmprueva cuenta actualizada



module.exports=router;