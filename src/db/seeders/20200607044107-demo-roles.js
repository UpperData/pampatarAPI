'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Roles', [{
        id:6,
        name: 'Comprador',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:5,
        name: 'Vendor' ,
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        id:7,
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