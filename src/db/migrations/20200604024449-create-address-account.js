'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('addressAccounts', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      addressId: {
        type:Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Addresses',schema:'public'},key:'id'
        }
      },
      accountId: {
        type:Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Accounts',schema:'public'},key:'id'
        }
      },
      addressTypeId: {
        type:Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'addressTypes',schema:'public'},key:'id'
        }
      },
      statusId: {
        type:Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Status',schema:'public'},key:'id'
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
    return queryInterface.dropTable('addressAccounts');
  }
};