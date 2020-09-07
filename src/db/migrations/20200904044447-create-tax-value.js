'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('taxValues', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      taxId: {
        type: Sequelize.INTEGER,        
        references:{
          model:{tableName:'taxes',schema:'public'},
          key:'id'
        }
      },
      value: {
        type: Sequelize.DECIMAL,
        unique:'taxValueKey',
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
          fields: ['taxId', 'value']
      }
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('taxValues');
  }
};