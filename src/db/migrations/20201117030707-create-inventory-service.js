'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('inventoryServices', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      sericeId: {
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'services',schema: 'public'},
          key:'id'
        }
      },
      note: {
        type: Sequelize.TEXT
      },
      price: {
        type: Sequelize.DECIMAL
      },
      serviceType: {
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'serviceTypes',schema: 'public'},
          key:'id'
        }
      },
      type: {
        type: Sequelize.STRING
        
      },
      timetable: {
        type: Sequelize.JSONB
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
    return queryInterface.dropTable('inventoryServices');
  }
};