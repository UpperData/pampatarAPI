'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('trackings', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      statusTrackingId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references:{
          model:{tableName:'statusTrackings',schema:'public'},
          key:'id'
        }
      },
      location: {
        type: Sequelize.STRING,
        allowNull: false
      },
      purchaseOrderId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references:{
          model:{tableName:'purchaseOrders',schema:'public'},
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
    return queryInterface.dropTable('trackings');
  }
};