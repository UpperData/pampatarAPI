'use strict';
module.exports = (sequelize, DataTypes) => {
  const sku = sequelize.define('sku', {    
    name: DataTypes.STRING,
    shopId: DataTypes.INTEGER
  }, {});
  sku.associate = function(models) {
    // associations can be defined here
  };
  return sku;
};