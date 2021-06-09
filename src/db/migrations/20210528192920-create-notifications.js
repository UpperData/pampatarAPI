'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('notifications', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      from: {
        type: Sequelize.STRING,
        allowNull:false
      },
      accountRolesId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'accountRoles',shema:'public'},
          key:'id'
        }
      },
      body: {
        type: Sequelize.JSONB,
        allowNull:false
      },
      read: {
        type: Sequelize.BOOLEAN,
        allowNull:false,
        dafaultValue:false
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
    return queryInterface.dropTable('notifications');
  }
};