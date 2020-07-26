'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Roles', [{
        name: 'Artesano',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        name: 'Comprador' ,
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        name: 'Administrador' ,
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Roles', null, {});
    
  }
};