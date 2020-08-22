'use strict';
module.exports = (sequelize, DataTypes) => {
  const shop = sequelize.define('shop', {
  	 shopRequestId:{
      type:DataTypes.INTEGER,
		  allowNull:false ,
      references:{
        model:{tableName:'shopRequests',schema:'public'},key:'id'
      }  
    },
    name: {
    	type:DataTypes.STRING,
    	allowNull:false,
      validate:{			      	 
        notEmpty:true		
      } 
    },    
    logo:{
      type:DataTypes.STRING,
      allowNull:true
    } ,
    processId:{
      type:DataTypes.INTEGER,
      allowNull:true  ,
      references:{
        model:{tableName:'Processes',schema:'public'},key:'id'
      }
    },
    shopDescription:{
      type:DataTypes.STRING,
		allowNull:false  
    },
    isLocal: {
    	type:DataTypes.BOOLEAN,
		allowNull:false      
    },
    employees: {
    	type:DataTypes.INTEGER,
		allowNull:false,
		validate:{			      	 
			len:[1,10000]		
		}    	
    },
    partner: {
    	type:DataTypes.JSONB
    },
    peopleId:{
    	type:DataTypes.INTEGER,
		allowNull:false   
    },
    phone: {
    	type:DataTypes.JSONB,
      allowNull:false  
    },
    address:{
    	type:DataTypes.JSONB,
      allowNull:true  
    },
    paymentCong: {
    	type:DataTypes.JSONB,
      allowNull:true  
    },
    storeType: {
    	type:DataTypes.JSONB,
      allowNull:true  
    },
    startActivity:{
      type:DataTypes.BOOLEAN,
      allowNull:false  
    },
    startActivityAttachment: {
    	type:DataTypes.STRING,
      allowNull:true  
    },
    statusId: {
      type:DataTypes.INTEGER,
      allowNull:false,		
      defaultValue:1,
      references:{
        model:{tableName:'Status',schema:'public'},key:'id'
      }
    }
  }, {});
  shop.associate = function(models) {
    shop.belongsTo(models.shopRequest);
    
    //models.shopRequest.belongsTo(shop);
    // associations can be defined here
  };
  return shop;
};