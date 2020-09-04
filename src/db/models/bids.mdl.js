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

    bidType:{
        type:DataTypes.INTEGER,
        allowNull:false,
        validate:{
            isIn:[[1,2]] // 1=servicio 2=producto
        }
    },
    title: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[10,200],
        notEmpty:true        
      }
    },
    brandId:{
      type:DataTypes.INTEGER,
      allowNull:false
    },
    longDesc:{
      type:DataTypes.TEXT,
      allowNull:false,
  
    },
    smallDesc:{
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[20,100]        
      }
    },
    disponibility:{
      type:DataTypes.INTEGER,
      allowNull:false
    },
    time:{
      type:DataTypes.INTEGER,
      allowNull:false,
      validate:{
          len:[0,3] //Numero de Días
      }      
    },
    devolution:{
      type:DataTypes.BOOLEAN,
      allowNull:false
      
    },  
    include:{
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[20,250],
        notEmpty:true
      }
    },customizable:{
      type:DataTypes.BOOLEAN,
      allowNull:false
    },
    customize:{
      type:DataTypes.STRING,
      allowNull:true,
      validate:{
        len:[0,250]
      }
    },
    garanty:{
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
          len:[0,3] //Meses de garantía
      }       
    },      
    tags:{
      type:DataTypes.JSONB,
      allowNull:true,
      validate:{   
        schema: schemaValidator({
          type: "array",
          items: {      
            type: "object",              
            properties: {                                                    
                name:{type:"string",required:true}
            }
          }           
        })
      } 
    },
    photos:{
      type:DataTypes.JSONB,
      allowNull:false,
      validate:{   
        schema: schemaValidator({
          type: "array",
          items: {
            type: "object",
            required: true,
            properties: {               
                id:{type:"number",required:true}
                
              
            }
          }           
        })
      }         
    },     
    category:{
      type:DataTypes.JSONB,
      allowNull:false,
      validate:{   
        schema: schemaValidator({
          type: "array",
          items: {
            type: "object",
            required: true,
            properties: {
                category: { 
                  type: "array",
                  required: true,
                  properties: {
                    id:{type:"number",required:true},
                    name:{type:"string",required:true}
                  }
                },
                subCategory: { 
                  type: "array",
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
    variation:{
      type:DataTypes.JSONB,
      allowNull:false,   
      validate:{   
        schema: schemaValidator({
          type: "array",
          items: {
            type: "object",
            required: true,
            properties: {
                piceType: { 
                  type: "object",
                  required: true,
                  properties: {
                    id:{type:"number",required:true},
                    name:{type:"string",required:true}
                  }
                },
                size: { 
                  type: "object",
                  required: true,
                  properties: {
                    id:{type:"number",required:true},
                    name:{type:"string",required:true}
                  }
                },
                price: {type:"number",required:true},
                cuantity: {type:"string",required:true},
                discount: {type:"number",required:true},
                color: {type:"string",required:true}
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
                id:{type:"number",required:true},
                name:{type:"string",required:true}
              
            }
          }           
        })
      }        
    },
    shopId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    WarehouseId: {
      type:DataTypes.INTEGER,
      allowNull:true
    },
    StatusId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    reasons:{
      type:DataTypes.JSONB,
      allowNull:true,
      validate:{   
        schema: schemaValidator({
          type: "array",
          required: true,
          items: {
            type: "object",
            required: true,
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
      allowNull:false 
    },
    schedule:{ //calendario
      type:DataTypes.INTEGER,
      allowNull:true
    },
    dimesion:{
      type:DataTypes.JSONB,
      allowNull:true,
      validate:{   
        schema: schemaValidator({
          type: "objet",
          required: true,
          items: {
            type: "object",
            required: true,
            properties: {               
              height:{type:"numnber",required:true},
              width:{type:"numnber",required:true},
              depth:{type:"numnber",required:true}
              
            }
          }           
        })
      }
      
    }

  }, { freezeTableName: true});
  Bids.associate = function(models) {
    // associations can be defined here 

    Bids.belongsTo(models.Status);
    Bids.belongsTo(models.Warehouse);
    Bids.belongsTo(models.shop);
    Bids.belongsTo(models.brands);
    

  };
  return Bids;
};