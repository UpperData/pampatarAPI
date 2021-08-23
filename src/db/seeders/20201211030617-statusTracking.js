'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('statusTrackings', [{
      name: 'Procesado',
      id:1,
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      name: 'Empaquetado',
      id:2,
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      name: 'Trasito a Destino',
      id:3,
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      name: 'Entregado ',
      id:4,
      createdAt: new Date(),
      updatedAt: new Date() 
    }], {});  
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('statusTrackings', null, {});
  }
};
