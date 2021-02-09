'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('inventoryTransactions', {
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
      inventoryId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'inventories',schema:'public'},
          key:'id'
        }
      },
      AccountId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'inventories',schema:'public'},
          key:'id'
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
    return queryInterface.dropTable('inventoryTransactions');
  }
};