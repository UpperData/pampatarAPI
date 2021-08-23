'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Genders', [{
    id:1,
      name: 'Hombre',
      createdAt: new Date(),
      updatedAt: new Date() 

    },{
    id:2,
      name: 'Mujer' ,
      createdAt: new Date(),
      updatedAt: new Date() 

    },{
    id:4,
      name: 'No Especifica' ,
      createdAt: new Date(),
      updatedAt: new Date() 

    }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Genders', null, {});
    
  }
};
