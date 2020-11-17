'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Modules', [{
        id:1,
        name: 'Postulaciones',
        StatusId:1,
        description:'Gestiona las postulaciones sin aprobación',
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:2,
        name: 'Contratos' ,
        description:'Gestiona los contratos con tiendas',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:3,
        name: 'Politicas de Vendedor' ,
        description:'Gestiona acuerdos comerciales',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:4,
        name: 'Tiendas',
        description:'Adminsitra y consulta las activiades de las tiendas',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:5,
        name: 'Notificaciones',
        description:'Gestiona las notificaciones para los usuarios',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:6,
        name: 'Invetario Global',
        description:'Monitoreo de inventario global de tiendas Pampatar',
        StatusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Modules', null, {});
    
  }
};