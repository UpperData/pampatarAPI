'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Accounts', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING,
        unique:true,
        allowNull:false,
        validate:{
          isAlpha:true,
          len:[6,16],
          notEmpty:true
        }
      },
      pass: {
        type: Sequelize.STRING,
        allowNull:false,
        validate:{
          len:[6,22],
          notEmpty:true
        }
      },
      email: {
        type: Sequelize.STRING,
        allowNull:false,
        unique:true,
        validate:{
          isEmail:true
        }
      },
      peopleId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
        references:{
          model:{tableName:'People',schema: 'public'},
          key:'id'
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
    return queryInterface.dropTable('Accounts');
  }
};
