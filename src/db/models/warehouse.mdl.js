var revalidator = require('revalidator');

var schemaValidator = function (schema) {
    return function (value) {
        var results = revalidator.validate(value, schema);
        if (!results.valid) throw new Error(JSON.stringify(results.errors));
    };
};
'use strict';
module.exports = (sequelize, DataTypes) => {
  const Warehouse = sequelize.define('Warehouse', {
    name: { 
      type:DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
        len:[4,60],
        notEmpty:true
      }
    },
    statusId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    shopId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    address: {
      type:DataTypes.JSONB,
      validate:{   
        schema: schemaValidator({
          type: "array",
          items: {
            type: "object",
            properties: {
                dirType: { 
                  type: "object",
                  required: true,
                  properties: {
                    id:{type:"number",required:true},
                    name:{type:"string",required:true}
                  }
                },
                region: { 
                  type: "object",
                  required: true,
                  properties: {
                    id:{type:"number",required:true},
                    name:{type:"string",required:true}
                  }
                },
                province: { 
                  type: "object",
                  required: true,
                  properties: {
                    id:{type:"number",required:true},
                    name:{type:"string",required:true}
                  }
                },
                comuna: { 
                  type: "object",
                  required: true,
                  properties: {
                    id:{type:"number",required:true},
                    name:{type:"string",required:true}
                  }
                },
                street: {type:"string",required:true},
                number: {type:"string",required:true},
                local: {type:"string",required:true}
            }
          } 
        })
      }
    },
    phone: {
      type:DataTypes.JSONB, 
        validate:{   
          schema: schemaValidator({
            type: "array",
            items: {
              type: "object",
              properties: {
                  phoneType: { 
                    type: "object",
                    required: true,
                    properties: {
                      id:{type:"number",required:true},
                      name:{type:"string",required:true}
                    }
                  },
                  number: { type: "number", required: true }
              }
            } 
          })
        }
    }
  }, {});
  Warehouse.associate = function(models) {
    // associations can be defined here   
    models.Status.belongsTo(models.Status,{foreignKey:'statusId'});
  };
  return Warehouse;
};
