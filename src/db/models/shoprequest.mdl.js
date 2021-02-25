'use strict';
var revalidator = require('revalidator');
var schemaValidator = function (schema) {
    return function (value) {
        var results = revalidator.validate(value, schema);
        if (!results.valid) throw new Error(JSON.stringify(results.errors));
    };
};
module.exports = (sequelize, DataTypes) => {
  const shopRequest = sequelize.define('shopRequest', {
    phone:{
		type:DataTypes.JSONB,
		allowNull:false,
      validate: {
         schema: schemaValidator({
             type: "array",
             properties: {
                 phoneType: { type: "string",uniqueItems: true, required: true },
                 phoneNumber:{ type: "string", dependencies: 'phoneType', required: true }                                  
             }
         })
      }    
    },
    marca:{
      type:DataTypes.STRING,
		allowNull:false,
		validate:{
			len:[2,100],
      notEmpty:true,
      isAlphanumeric: true	
		}	    
    },
    storeType:{
		type:DataTypes.JSONB,
		allowNull:false,
      validate: {
         schema: schemaValidator({
         	data:{
             type: "object",
             properties: {             	 
                 id: { type: "number", uniqueItems: true, required: true },   
                 name: { type: "string", dependencies:"id", required: true }                                                 
             }
            }
         })
      }     
    },
    startActivity:{
      type:DataTypes.BOOLEAN,
		allowNull:false,
		validate:{			
			notEmpty:true		
		}    
    },
    isStore:{
      type:DataTypes.BOOLEAN,
      allowNull:false,
      validate:{			
        notEmpty:true		
      }      
    },
    descShop:{
      type:DataTypes.STRING,
		  allowNull:false,
		validate:{
			len:[100,400],
			notEmpty:true		
		}	    
    },
    salesChannels:{
		type:DataTypes.JSONB,
		allowNull:false,
      validate: {
         schema: schemaValidator({
         	data:{
             type: "object",
             properties: {             	 
                 id: { type: "number", uniqueItems: true, required: true },   
                 name: { type: "string", dependencies:"id", required: true },
                 date:{type: "string",dependencies:"id", required: false}                                                 
             }
            }
         })
      }     
    },
    affirmations:{
		type:DataTypes.JSONB,
		allowNull:false,
      validate: {
         schema: schemaValidator({
         	data:{
             type: "object",
             properties: {
                 id: { type: "number", uniqueItems: true,required: true },
                 name: { type: "string", dependencies:"id",required: true }                                                    
             }
            }
         })
      }     
    },
    employees:{
      type:DataTypes.INTEGER,
      allowNull:false,
      validate:{
        isInt: true, 
        max: 10000,  
          min: 1,      
        notEmpty:true		
      }    
    },
    AccountId:{
      type:DataTypes.INTEGER,
		  allowNull:false,
		  validate:{			      	 
			notEmpty:true		
      } 
    },
    status:{
		type:DataTypes.JSONB,
		allowNull:false,
      validate: {
         schema: schemaValidator({
         	data:{
             type: "array",
             properties: {             	 
                 id: { type: "number", uniqueItems: true,required: true },   
                 name: { type: "string",dependencies:"id", required: true },
                 date:{type: "string", dependencies:"id", required: false}                                                 
             }
            }
         })
      }     
    }

  }, {});
  shopRequest.associate = function(models) {
    // associations can be defined here
    shopRequest.belongsTo(models.Account);   
    shopRequest.hasOne(models.shop);

   
  };
  return shopRequest;
};