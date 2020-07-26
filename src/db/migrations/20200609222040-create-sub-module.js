'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('subModules', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING,
        allowNull:false,
        unique:true,
        validate:{
          isAlpha:true,
          len:[4,60],
          notEmpty:true
        }
      },
      route: {
        type: Sequelize.STRING,
        allowNull:false,
        unique:true,
        validate:{          
          len:[1,120],
          notEmpty:true
        }
      },
      statusId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
        references:{
          model:{tableName:'Status',schema: 'public'},
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
    return queryInterface.dropTable('subModules');
  }
};