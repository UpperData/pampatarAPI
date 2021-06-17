'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('petittyons', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      purchaseOrderId: {
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'purchaseOrders',shema:'public'},
          key:'id'
        }
      },
      items: {
        type: Sequelize.JSONB
      },
      processed: {
        type: Sequelize.BOOLEAN
      },
      shopId: {
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'shops',shema:'public'},
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
    return queryInterface.dropTable('petittyons');
  }
};