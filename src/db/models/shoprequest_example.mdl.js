'use strict';

var revalidator = require('revalidator');
var schemaValidator = function (schema) {
    return function (value) {
        var results = revalidator.validate(value, schema);
        if (!results.valid) throw new Error(JSON.stringify(results.errors));
    };
};
module.exports = (sequelize, DataTypes) => {
  const shopRequestxx = sequelize.define('shopRequest', {
    document: {
		type:DataTypes.JSONB,
		allowNull:false,
      validate: {
         schema: schemaValidator({
             type: "array",
             properties: {
                 docType:{type: "number", allowEmpty : false , uniqueItems: true, required: true },
                 docNumber:{type: "string",allowEmpty : false , maxLength:20 , dependencies: 'docType',uniqueItems: true, required: true },
                 attachmentId:{type:"integer",required: true}                 
             }
         })
      }
	 },
    firstName:{
    	type:DataTypes.STRING,
		allowNull:false,
		validate:{
			len:[1,30],
			notEmpty:true		
		}		
		
	 },
    lastName:{
      type:DataTypes.STRING,
		allowNull:false,
		validate:{
			len:[1,30],
			notEmpty:true		
		}
	 },
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
			len:[2,30],
			notEmpty:true		
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
    },
    birthDate:{
      type:DataTypes.DATE,
      allowNull:false,
      validate:{
        isDate:true
      }
    },
    genderId:{
      type:DataTypes.INTEGER,
      allowNull:false
    },
    nationalityId:{
      type:DataTypes.INTEGER,
      allowNull:false
    }

  }, {});
  shopRequestxx.associate = function(models) {
    // associations can be defined here
    shopRequestxx.belongsTo(models.Account);
    //models.shop.hasMany(shopRequest);
    shopRequestxx.hasOne(models.shop);

   
  };
  return shopRequestxx;
};