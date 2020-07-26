'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Bids', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      bidType:{
        type:Sequelize.INTEGER,
        allowNull:false 
      },
      title: {
        type:Sequelize.STRING,
        allowNull:false
      },
      brandId:{
        type:Sequelize.INTEGER,
        allowNull:false,
        references:{
          model:{tableName:'Brands',schema:'public'},key:'id'
        }
      },
      longDesc:{
        type:Sequelize.TEXT,
        allowNull:false
      },
      smallDesc:{
        type:Sequelize.STRING,
        allowNull:false
      },
      disponibility:{
        type:Sequelize.INTEGER,
        allowNull:false
      },
      time:{
        type:Sequelize.INTEGER,
        allowNull:false      
      },
      devolution:{
        type:Sequelize.BOOLEAN,
        defaultValues:true
      },  
      include:{
        type:Sequelize.STRING,
        allowNull:false
      },
      customize:{
        type:Sequelize.STRING,
        allowNull:true
      },
      garanty:{
        type:Sequelize.STRING,
        allowNull:true,
        validate:{
          isIn:[1,2,3] //3 meses de garantía, 6 meses de garantía, No Tiene
        }
      },      
      tags:{
        type:Sequelize.JSON,
        allowNull:true
      },
      photos:{
        type:Sequelize.JSON,
        allowNull:false        
      },     
      category:{
        type:Sequelize.JSON,
        allowNull:false        
      },
      variation:{
        type:Sequelize.JSON,
        allowNull:false        
      },
      accountRoleId: {
        type:Sequelize.INTEGER,
        allowNull:false
      },
      WarehouseId: {
        type:Sequelize.INTEGER,
        allowNull:true
      },
      StatusId: {
        type:Sequelize.INTEGER,
        allowNull:false
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
    return queryInterface.dropTable('Bids');
  }
};