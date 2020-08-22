'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('statusProcesses', [{
        name: 'Pendiente',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'En Evaluación',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Aprobado',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Negado',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('statusProcesses', null, {});

  }
};