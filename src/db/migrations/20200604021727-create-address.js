'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Addresses', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      provinceId: {
        type:Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Provinces',schema:'public'},key:'id'
        }
      },
      postalCodeId: {
        type:Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'postalCodes',schema:'public'},key:'id'
        }
      },   
      street: {
        type:Sequelize.STRING,
        allowNull:false,
        validate:{
          len:[3,100],
          notEmpty:true
        }
      },  
      description: {
        type:Sequelize.STRING,
        allowNull:false,
        validate:{
          len:[3,400],
          notEmpty:true
        }
      },  
      statusId: {
        type:Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Status',schema:'public'},key:'id'
        }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('addresses');
  }
};