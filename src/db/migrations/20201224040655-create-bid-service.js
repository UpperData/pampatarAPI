var revalidator = require('revalidator');

var schemaValidator = function (schema) {
    return function (value) {
        var results = revalidator.validate(value, schema);
        if (!results.valid) throw new Error(JSON.stringify(results.errors));
    };
};
'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('bidServices', {
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
          model:{tableName:'inventoryServices',schema:'public'},
          key:'id'
        }

      },
      title: {
        type: Sequelize.STRING,
        unique:true,
        allowNull:false
      },
      photos: {
        type: Sequelize.JSONB,
        allowNull:false
      },
      videos: {
        type: Sequelize.JSONB
      },
      longDesc: {
        type: Sequelize.TEXT,
        allowNull:false        
      },
      smallDesc: {
        type: Sequelize.STRING,
        allowNull:false
      },
      tags: {
        type: Sequelize.JSONB,
        allowNull:false
      },
      category: {
        type: Sequelize.JSONB,
        allowNull:false
      },
      materials: {
        type: Sequelize.INTEGER,
        allowNull:false
      },
      quantity: {
        type: Sequelize.INTEGER,
        allowNull:false
      },
      serviceTypeId: {
        type: Sequelize.INTEGER,
        references:{
          model:{tableName:'serviceTypes',schema:'public'},
          key:'id'
        }
      },
      disponibility: {
        type: Sequelize.INTEGER,
        allowNull:false
      },
      shedule: {
        type: Sequelize.JSONB,
        allowNull:false
      },
      discount: {
        type: Sequelize.DECIMAL
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
    return queryInterface.dropTable('bidServices');
  }
};