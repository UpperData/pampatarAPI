'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('bidUpdateRequests', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      shopId: {
        allowNull: false,
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'shops',schema:'public'},key:'id'
        }
      },
      bidId: {
        allowNull: false,
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'Bids',schema:'public'},key:'id'
        }
      },
      change: {
        allowNull: false,
        type: Sequelize.JSONB
      },
      statusProcessId: {
        allowNull: false,
        type: Sequelize.INTEGER, 
        references:{
          model:{tableName:'statusProcesses',schema:'public'},key:'id'
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
    return queryInterface.dropTable('bidUpdateRequests');
  }
};