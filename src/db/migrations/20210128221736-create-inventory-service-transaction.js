'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('inventoryServiceTransactions', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      type: {
        type: Sequelize.STRING,
        allowNull:false
      },
      quantity: {
        type: Sequelize.DECIMAL,
        allowNull:false
      },
      inventoryServiceId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'inventoryServices',schema:'public'},key:'id'
        }
      },
      AccountId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Accounts',schema:'public'},key:'id'
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
    return queryInterface.dropTable('inventoryServiceTransactions');
  }
};