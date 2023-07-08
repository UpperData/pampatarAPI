'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('shops', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name:{
        type:Sequelize.STRING,
        allowNull:true,
        unique:true        
        },    
        logo:{
          type:Sequelize.STRING,
          allowNull:true
        } ,
        processId:{
          type:Sequelize.JSONB,
          allowNull:true  
        },
        shopDescription:{
          type:Sequelize.STRING,
        allowNull:false  
        },
        isLocal: {
          type:Sequelize.BOOLEAN,
        allowNull:false      
        },
        employees: {
          type:Sequelize.INTEGER,
        allowNull:false,
        validate:{			      	 
          len:[1,10000]		
        }    	
        },
        partner: {
          type:Sequelize.JSONB
        },   
        phone: {
          type:Sequelize.JSONB,
          allowNull:false  
        },
        address:{
          type:Sequelize.JSONB,
          allowNull:true  
        },
        paymentCong: {
          type:Sequelize.JSONB,
          allowNull:true  
        },
        storeType: {
          type:Sequelize.JSONB,
          allowNull:true  
        },
        startActivity:{
          type:Sequelize.BOOLEAN,
          allowNull:false  
        },
        startActivityAttachment: {
          type:Sequelize.STRING,
          allowNull:true  
        },
        statusId: {
          type:Sequelize.INTEGER,
          allowNull:false,		
          defaultValue:1,
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
    }
    );
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('shops');
  }
};