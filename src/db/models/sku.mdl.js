'use strict';
module.exports = (sequelize, DataTypes) => {
  const sku = sequelize.define('sku', {    
    name: {
      type:DataTypes.STRING,
      allowNull:false
    },
    skuTypeId:{
      type:DataTypes.INTEGER,
      allowNull:false,
      references:{
        model:{tableName:'skuTypes',schema:'public'},
        key:'id'
      }
    },
    shopId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  sku.associate = function(models) {
    // associations can be defined here
    sku.belongsTo(models.shop);
    sku.belongsTo(models.skuType);
  };
  return sku;
};