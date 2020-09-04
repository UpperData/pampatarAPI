'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('shopContracts', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      contractId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        unique:'shopContractKey',
        references:{
          model:{tableName:'attachments',schema: 'public'},
          key:'id'
        }
      },
      shopId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        unique:'shopContractKey',
        references:{
          model:{tableName:'shops',schema:'public'},
          key:'id'
        }
      },
      statusId: {
        type: Sequelize.INTEGER,
	      allowNull:false,        
        references:{
          model:{tableName:'Status',schema:'public'},
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
          fields: ['contractId', 'shopId']
      }
      }
    }
    );
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('shopContracts');
  }
};