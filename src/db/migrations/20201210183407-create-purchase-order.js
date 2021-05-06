'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('purchaseOrders', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      AccountId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references:{
          model:{tableName:'Accounts', schema:'public'},
          key:'id'
        }
      },shipping: {
        type: Sequelize.JSONB,
        allowNull: false
      },items: {
        type: Sequelize.JSONB,
        allowNull: false
      },pay: {
        type: Sequelize.JSONB,
        allowNull: false
      },people: {
        type: Sequelize.JSONB,
        allowNull: false
      },seller: {
        type: Sequelize.JSONB,
        allowNull: false
      },statusTrackingId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references:{
          model:{tableName:'Accounts', schema:'public'},
          key:'id'
        }
      },historyStatus: {
        type: Sequelize.INTEGER,
        allowNull: false
      },createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('purchaseOrders');
  }
};