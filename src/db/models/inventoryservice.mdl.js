'use strict';
var revalidator = require('revalidator');

var schemaValidator = function (schema) {
    return function (value) {
        var results = revalidator.validate(value, schema);
        if (!results.valid) throw new Error(JSON.stringify(results.errors));
    };
};

module.exports = (sequelize, DataTypes) => {
  const inventoryService = sequelize.define('inventoryService', {
    serviceId: {
      type: DataTypes.INTEGER,
      allowNull:false
    },
    note: {
      type:DataTypes.TEXT
    },
    price: {
      type: DataTypes.DECIMAL,
      allowNull:false
    },
    serviceTypeId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    type: {
      type:DataTypes.STRING,
      validate:{
        isIn:[['in','out']]
      },
      allowNull:false
    },
    quantity:{
      type:DataTypes.INTEGER,      
      allowNull:false
    },
    timetable: {
      type:DataTypes.JSONB,
      allowNull:false,
      validate:{   
        schema: schemaValidator({
          type: "object",
          items: {
            type: "object",
            properties: {
              days: {
                type: "array",
                required: true,
                  properties: {
                    id:{type:"number",required:true},
                    name:{type:"string",required:true},
                    hours:{
                      type: "object",
                      required: true,
                      start:{type:"string",require:true},
                      end:{type:"string",require:true},
                    }
                  }
              },
              dateStart: { type: "string", required: true },
              dateEnd: { type: "string", required: true },

            }
          }
        })
      }
    }
  }, {});
  inventoryService.associate = function(models) {
    // associations can be defined here
    inventoryService.belongsTo(models.serviceType);
  };
  return inventoryService;
};