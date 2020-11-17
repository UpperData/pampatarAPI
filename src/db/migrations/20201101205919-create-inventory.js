'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('inventories', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      warehouseId: {
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'Warehouses',schema: 'public'},
          key:'id'
        }
      },
      skuId: {
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'skus',schema: 'public'},
          key:'id'
        }
      },
      note: {
        type: Sequelize.TEXT
      },
      price: {
        type: Sequelize.DECIMAL
      },
      type: {
        type: Sequelize.STRING
      },
      dataTime: {
        type: Sequelize.DATE
      },
      shopId: {
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'shops',schema: 'public'},
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
    return queryInterface.dropTable('inventories');
  }
};