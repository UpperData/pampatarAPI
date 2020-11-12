const express=require('express');
const router=express.Router();
const authorization =require('../../controllers/middleware/authorization.ctrl');
const seller=require('../../controllers/seller.ctrl');




//router.put('/bids/:id',seller.shopRequest) // Solicitud de creación de tienda
//router.post('/bids/add',seller.status) // Registrar publicación
router.get('/bids/search/:id',authorization.requireRole([{"id":5}]),seller.getBidOne); // trae una publicación del vendedor
router.get('/bids/all',authorization.requireRole([{"id":5}]),seller.getBidAll); // trae todas publicación del vendedor
router.put('/shop/config',authorization.requireRole([{"id":5}]),seller.configShop); // Configurar Tienda 
router.post('/bids/add',authorization.requireRole([{"id":5}]),seller.addBid); // Agregar una publicación
router.post('/sku/add',authorization.requireRole([{"id":5}]),seller.addSKU); // Agregar una SKU 
router.put('/sku/edit',authorization.requireRole([{"id":5}]),seller.editSKU); // Agregar una SKU 
router.get('/sku/myList',authorization.requireRole([{"id":5}]),seller.mySKUlist); // Listar SKU por tienda
router.post('/inventory',authorization.requireRole([{"id":5}]),seller.inventoryAll); // Ingreso o salida de inventario
router.get('/shop/getValidShopUpdate',authorization.requireRole([{"id":5}]),seller.validateIsShopUpdate) // Comprueba cuenta actualizada
router.get('/inventory/ProductShop/price/:sku',authorization.requireRole([{"id":5}]),seller.inventoryShopAvgProduct);
router.post('/inventory/product/all',authorization.requireRole([{"id":5}]),seller.inventoryAll);
router.post('/service/add',authorization.requireRole([{"id":5}]),seller.serviceAdd); // Agregar un servicio
router.get('/services/myList',authorization.requireRole([{"id":5}]),seller.myServiceslist); // Listar servicios tienda actual
router.put('/services/edit',authorization.requireRole([{"id":5}]),seller.editService); // Editar una Servicio 
router.get('/services/:id',authorization.requireRole([{"id":5}]),seller.myServicesById); // Encontrar servicios tienda actual por ID
router.get('/sku/:id',authorization.requireRole([{"id":5}]),seller.mySkuById); // Encontrar sku tienda actual por ID
router.get('/seller/profile',authorization.requireRole([{"id":5}]),seller.getProfile); // perfil de usuario
router.put('/seller/update/logo',authorization.requireRole([{"id":5}]),seller.updateLogo); // Actualiza logo de tienda
module.exports=router;