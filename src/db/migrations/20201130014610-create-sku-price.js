'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('skuPrices', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      skuId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'skus',schema: 'public'},
          key:'id'
        }
      },
      shopId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'shops',schema: 'public'},
          key:'id'
        }
      },
      price:{
        type: Sequelize.DECIMAL,
        allowNull:false
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    },{
      uniqueKeys: {
        actions_unique: {
          customIndex: true,
          fields: ['price', 'skuId','createdAt','shopId']
      }
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('skuPrices');
  }
};