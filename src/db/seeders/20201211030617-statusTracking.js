'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('statusTrackings', [{
      name: 'Procesado',
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      name: 'Empaquetado',
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      name: 'Trasito a Destino',
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      name: 'Entregado ',
      createdAt: new Date(),
      updatedAt: new Date() 
    }], {});  
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('statusTrackings', null, {});
  }
};
