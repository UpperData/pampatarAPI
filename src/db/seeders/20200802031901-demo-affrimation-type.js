'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('affirmations', [{
        name: 'Estoy empezando, me vendría bien ayuda para profesionalizar mi negocio y poder dedicarme tiempo completo',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
		{
        name: 'Tengo una marca en desarrollo con ventas, Me vendría bien ayuda en la gestión para poder escalar mi negocio',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
      {
        name: 'Tengo un negocio consolidado y una marca reconocida, me vendría bien poder ofrecerlo de forma Omnicanal y así captar más mercado',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      }     
      ], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('affirmations', null, {});

  }
};
