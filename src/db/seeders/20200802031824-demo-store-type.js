'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('storeTypes', [{
        name: 'Fabrico Productos Hechos a mano',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
		{
        name: 'Fabrico Productos con la ayuda de un socio productor',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      },
      {
        name: 'Soy distribuidor de una marca de Insumos o herramientas del rubro de artes, manualidades o celebraciones',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      } ,
      {
        name: 'Presto servicios o imparto cursos para el rubro de artes, manualidades o celebraciones',
        statusId:1,
        createdAt: new Date(),
        updatedAt: new Date() 
      }     
      ], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('storeTypes', null, {});

  }
};
