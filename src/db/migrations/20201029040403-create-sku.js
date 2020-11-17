'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('skus', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING,
        allowNull:false
      },
      shopId: {
        type: Sequelize.INTEGER,
        allowNull:false,
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
    },
    {
      uniqueKeys: {
        actions_unique: {
          customIndex: true,
          fields: ['name', 'shopId']
      }
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('skus');
  }
};