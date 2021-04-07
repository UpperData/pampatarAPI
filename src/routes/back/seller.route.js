const express=require('express');
const router=express.Router();
const authorization =require('../../controllers/middleware/authorization.ctrl');
const seller=require('../../controllers/seller.ctrl');
const generals=require('../../controllers/generals.ctrl');

//router.put('/bids/:id',seller.shopRequest) // Solicitud de creación de tienda
//router.post('/bids/add',seller.status) // Registrar publicación
router.get('/bids/search/:id',authorization.requireRole([{"id":5}]),seller.getBidOne); // trae una publicación del vendedor
router.get('/bids/all',authorization.requireRole([{"id":5}]),seller.getBidAll); // trae todas publicación del vendedor
router.put('/shop/config',authorization.requireRole([{"id":5}]),seller.configShop); // Configurar Tienda 
router.post('/seLLer/BIds/Add',authorization.requireRole([{"id":5}]),seller.addBid); // Agregar una publicación
router.post('/sku/add',authorization.requireRole([{"id":5}]),seller.addSKU); // Agregar una SKU 
router.put('/sku/edit',authorization.requireRole([{"id":5}]),seller.editSKU); // Agregar una SKU 
router.get('/sku/myList',authorization.requireRole([{"id":5}]),seller.mySKUlist); // Listar SKU por tienda
//router.post('/inventory',authorization.requireRole([{"id":5}]),seller.inventoryAll); // Ingreso o salida de inventario
router.get('/shop/getValidShopUpdate',authorization.requireRole([{"id":5}]),seller.validateIsShopUpdate) // Comprueba cuenta actualizada
//router.get('/inventory/ProductShop/price/:sku',authorization.requireRole([{"id":5}]),seller.inventoryShopAvgProduct); // Precio promedio
router.post('/inventory/product/all',authorization.requireRole([{"id":5}]),seller.inventoryAll); //Ingresa lote al inventario
router.post('/service/add',authorization.requireRole([{"id":5}]),seller.serviceAdd); // Agregar un servicio
router.get('/services/myList',authorization.requireRole([{"id":5}]),seller.myServiceslist); // Listar servicios tienda actual
router.put('/services/edit',authorization.requireRole([{"id":5}]),seller.editService); // Editar una Servicio 
router.get('/services/:id',authorization.requireRole([{"id":5}]),seller.myServicesById); // Encontrar servicios tienda actual por ID
router.get('/sku/:id',authorization.requireRole([{"id":5}]),seller.mySkuById); // Encontrar sku tienda actual por ID
router.get('/seller/profile',authorization.requireRole([{"id":5}]),seller.getProfile); // perfil de usuario
router.put('/seller/update/logo',authorization.requireRole([{"id":5}]),seller.updateLogo); // Actualiza logo de tienda
router.get('/seller/get/logo',authorization.requireRole([{"id":5}]),seller.getLogo); // Actualiza logo de tienda
//router.get('/seller/inventory/serviceStock/:serviceId',authorization.requireRole([{"id":5},{"id":7}]),seller.inventoryStockService); // Stock de servicios
router.get('/seller/inventory/productStock/skuId/:skuId/shopId/:shopId',authorization.requireRole([{"id":5},{"id":7}]),generals.inventoryStock); // Stock by product in Shop
router.post('/seller/inventory/serviceProcess/',authorization.requireRole([{"id":5},{"id":7}]),seller.inventoryServiceAll); // Agregar inventario de servicios
router.get('/seller/inventory/stock/sku/:productId/:type',authorization.requireRole([{"id":5}]),seller.stockMonitor); // Stock by sku and shop
router.get('/seller/inventory/lot/sku/list/all/:skuId',authorization.requireRole([{"id":5}]),seller.getLoteProduct); // lot list shop
router.get('/seller/inventory/lot/sku/:id',authorization.requireRole([{"id":5}]),seller.getLoteProductById); // lot by sku and shop
router.put('/seller/inventory/lot/edit/',authorization.requireRole([{"id":5}]),seller.editLoteProduct); // Lot edit
router.put('/seller/inventory/price/edit/',authorization.requireRole([{"id":5}]),seller.priceUpdateInventory); // price edit
router.get('/seller/serVice/StoCk/get/:serviceId',authorization.requireRole([{"id":5}]),seller.stockService); // stock Service
router.put('/seller/serVice/inVEntory/UPDaTe/',authorization.requireRole([{"id":5}]),seller.editInventoryService); // Update Invetory Service
router.get('/seller/seRvice/invenTory/GETALL/:serviceId',authorization.requireRole([{"id":5}]),seller.inventoryServiceList); // Update Invetory Service

module.exports=router;