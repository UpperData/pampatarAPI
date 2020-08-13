'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Warehouses', [{
        name: 'Principal',
        statusId:1,
        address:"Matucana N° 151, Santiago",
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        name: 'Secundario' ,
        statusId:1,
        address:"Alonso de Córdova 5151, Oficina 101. Las Condes, Santiago – Chile",
        createdAt: new Date(),
        updatedAt: new Date() 

      },{	
        name: 'Casa' ,
        statusId:1,
        address:" Av. Dag Hammarskjöld 3477. Vitacura, Santiago de Chile",
        createdAt: new Date(),
        updatedAt: new Date() 

      }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Warehouses', null, {});
    
  }
};