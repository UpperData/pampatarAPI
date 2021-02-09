'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('days', [{
        name: 'Domingo',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Lunes',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Martes',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Miercoles',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Jueves',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Viernes',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Sabado',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('days', null, {});

  }
};