'use strict';
var revalidator = require('revalidator');

var schemaValidator = function (schema) {
    return function (value) {
        var results = revalidator.validate(value, schema);
        if (!results.valid) throw new Error(JSON.stringify(results.errors));
    };
};
module.exports = (sequelize, DataTypes) => {
  const inventory = sequelize.define('inventory', {
    WarehouseId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    skuId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    note: {
      type:DataTypes.TEXT
    },
    price: {
      type:DataTypes.DECIMAL,      
      allowNull:false,
      validate:{
        min: 1
      }
    },
    quantity:{
      type:DataTypes.INTEGER,      
      allowNull:false
      
    },
    type: {
      type:DataTypes.STRING,
      allowNull:false,
	    isIn:[['in','out']]
    },
    dataTime: {
      type:DataTypes.DATE,
      allowNull:false
    },
    inPrice:{
      type:DataTypes.BOOLEAN,
      defaultValue:true
    },
    shopId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    variation:{
      type:DataTypes.JSONB,
    }
  }, {});
  inventory.associate = function(models) {
    // associations can be defined here
    inventory.belongsTo(models.shop);
    inventory.belongsTo(models.Warehouse);
    inventory.belongsTo(models.shop);
    inventory.belongsTo(models.sku);
  };
  return inventory;
};
