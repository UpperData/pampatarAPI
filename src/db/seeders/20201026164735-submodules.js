'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('subModules', [{
        id:1,
        ModuleId:1,
        name: 'Procesar',
        route:'/processRequest',
        StatusId:1,
        description:'Puede Pre-Aprobar o rechazar una postulación',
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:2,
        ModuleId:1,
        name: 'Consulta Postulaciones' ,
        route:'/selectRequest',
        description:'Encuenta las postulaciones en diferentes estatus',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:3,
        ModuleId:1,
        name: 'Aprobación ' ,
        route:'/aproveRequest',
        description:'Aprubea las postulaciones procesadas',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:4,
        ModuleId:6,
        name: 'Por Tienda ' ,
        route:'/invetoryByShop',
        description:'Monitor de inventario por Tienda ',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:5,
        ModuleId:6,
        name: 'Por Producto ' ,
        route:'/inventoryByProduct',
        description:'Monitor de inventario por producto',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:6,
        ModuleId:6,
        name: 'Por Localidad ' ,
        route:'/inventoryByLocation',
        description:'Monitor de inventario por unicación geográfica de la tienda',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:7,
        ModuleId:2,
        name: 'Contrato ' ,
        route:'/createContrat',
        description:'Registra contrato y condiciones con tienda Pampatar',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:8,
        ModuleId:2,
        name: 'Consulta de Contratos ' ,
        route:'/viewContrat',
        description:'Encuentra los contratos creados en diferentes status',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:9,
        ModuleId:4,
        name: 'Monitor de Ventas' ,
        route:'/shopSalesMonitor',
        description:'Monitor de Ventas de por tienda',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:10,
        ModuleId:3,
        name: 'Actualizar politicas' ,
        route:'/upgradePolitics',
        description:'Actualizar politicas de vendedor',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:12,
        ModuleId:5,
        name: 'Enviar Notificaciones' ,
        route:'/notificationsSend',
        description:'Enviar notificaciones a usuarios',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('subModules', null, {});
    
  }
};