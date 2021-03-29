var revalidator = require('revalidator');

var schemaValidator = function (schema) {
    return function (value) {
        var results = revalidator.validate(value, schema);
        if (!results.valid) throw new Error(JSON.stringify(results.errors));
    };
};
'use strict';
module.exports = (sequelize, DataTypes) => {
  const Bids = sequelize.define('Bids', {
    skuId:{
      type:DataTypes.INTEGER,
      allowNull:false
  },
    skuTypeId:{
        type:DataTypes.INTEGER,
        allowNull:false
    },
    title: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[20,200],
        notEmpty:true
      }
    },
    BrandId:{
      type:DataTypes.INTEGER,
      allowNull:true
    },
    longDesc:{
      type:DataTypes.TEXT,
      allowNull:false,
      validate:{
        len:[200,800]
      }
  
    },
    smallDesc:{
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[20,200]        
      }
    },
    disponibilityId:{
      type:DataTypes.INTEGER,
      allowNull:false
    },
    time:{ //tiempo fabricación (Días habiles)
      type:DataTypes.STRING,
      allowNull:true,
      validate:{
          len:[0,3] //Numero de Días
      }      
    },
    devolution:{
      type:DataTypes.BOOLEAN,
      allowNull:false
      
    },  
    include:{
      allowNull:true,
      type:DataTypes.STRING,
      validate:{
        len:[10,250],
        notEmpty:true
      }
    },customizable:{
      type:DataTypes.BOOLEAN,
      allowNull:true
    },
    customize:{
      type:DataTypes.STRING,
      allowNull:true,
      validate:{
        len:[0,250]
      }
    },
    garanty:{ // DIAS DE GARANTIA
      type:DataTypes.INTEGER,
      allowNull:false,
      validate:{
          len:[0,3] //Días de garantía
      }       
    },      
    tags:{
      type:DataTypes.JSONB,
      allowNull:true,
      validate:{   
        schema: schemaValidator({
          type: "object"          
        })
      } 
    },
    photos:{
      type:DataTypes.JSONB,
      allowNull:false,
      validate:{   
        schema: schemaValidator({
          type: "object"
        })
      }         
    },     
    category:{
      type:DataTypes.JSONB,
      allowNull:false,
      validate:{   
        schema: schemaValidator({
          type: "object",
          items: {
            type: "array",
            required: true,
            properties: {                               
              id:{type:"number",required:true},
              name:{type:"string",required:true},
              subCategory: {                      
                required: true,
                properties: {
                  id:{type:"number",required:true},
                  name:{type:"string",required:true}
                }
              }                                
            }
          } 
        })
      }      
    },    
    materials:{
      type:DataTypes.JSONB,
      allowNull:false,
      validate:{   
        schema: schemaValidator({
          type: "array",
          items: {
            type: "object",
            required: true,
            properties: {               
                id:{type:"string",required:true},
                name:{type:"string",required:true},
                qty:{type:"string",required:true}
              
            }
          }           
        })
      }        
    },
    shopId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    status: {
      type:DataTypes.JSONB,
      allowNull:false,
      vaidate:{
        schema: schemaValidator({
          type:"array",
          required:false,
          items:{
            type:"object",
            required:{
              id:{type:"number",required:true},
              name:{type:"string",required:true},
              date:{type:"string",required:true}
            }

          }
        })
      }
    },
    reasons:{ //Motivos / razones
      type:DataTypes.JSONB,
      allowNull:true,
      validate:{   
        schema: schemaValidator({
          type: "array",
          required: false,
          items: {
            type: "object",
            required: false,
            properties: {               
                id:{type:"number",required:true},
                name:{type:"string",required:true}
              
            }
          }           
        })
      }        
    },
    weight:{ //peso
      type:DataTypes.DECIMAL(10, 2)  ,
      allowNull:true 
    },
    schedule:{ //calendario
      type:DataTypes.INTEGER,
      allowNull:true
    },
    dimension:{
      type:DataTypes.JSONB,
      allowNull:true,
      validate:{   
        schema: schemaValidator({
          type: "array",
          required: false,
          items: {
            type: "object",
            required: false,
            properties: {               
              height:{type:"string",required:true},
              width:{type:"string",required:true},
              depth:{type:"string",required:true}
              
            }
          }           
        })
      }
      
    }

  }, { freezeTableName: true});
  Bids.associate = function(models) {
    // associations can be defined here 
    
    Bids.belongsTo(models.shop);
    Bids.belongsTo(models.Brands);
    Bids.belongsTo(models.disponibility);
    Bids.belongsTo(models.skuType);
  

  };
  return Bids;
};