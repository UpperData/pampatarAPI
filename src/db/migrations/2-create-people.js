'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('People', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      firstName: {
        type: Sequelize.STRING,
        allowNull:false,
        validate:{
          isAlpha:true,
          len:[1,60],
          notEmpty:true
	      }
      },
      lastName: {
        type: Sequelize.STRING,
        allowNull:false,
        validate:{
          isAlpha:true,
          len:[1,60],
          notEmpty:true
        }
      },
      documentType:{
        type: Sequelize.INTEGER,
        allowNull:false
      },
      documentId: {
        type: Sequelize.STRING,
        unique:true,
        allowNull:false
      },
      genderId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Genders', schema:'public'},
          key:'id'
        }
      },
      nationalityId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Nationalities', shema:'public'},
          key:'id'
        }
      },
      birthDate: {
        type: Sequelize.DATE,
        allowNull:false,
        validate:{
          isDate:true,
          notEmpty:true,
          isBefore:"2002-01-01"
        }
      },
      statusId: {
        type: Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Status', shema:'public'},
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
    return queryInterface.dropTable('People');
  }
};
