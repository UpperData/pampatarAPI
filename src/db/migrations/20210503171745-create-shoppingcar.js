'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('shoppingcars', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'Accounts',shema:'public'},key:'id'
        }
      },
      items: {
        type: Sequelize.JSONB,
        allowNull: false
      },
      StatusId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references:{
          model:{tableName:'Status',shema:'public'},key:'id'
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
    return queryInterface.dropTable('shoppingcars');
  }
};