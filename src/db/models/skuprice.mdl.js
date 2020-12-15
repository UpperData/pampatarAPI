'use strict';
module.exports = (sequelize, DataTypes) => {
  const skuPrice = sequelize.define('skuPrice', {
    skuId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    shopId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },price: {
      type:DataTypes.DECIMAL(50,2),
      allowNull:false
    }
  }, {});
  skuPrice.associate = function(models) {
    // associations can be defined here
    skuPrice.belongsTo(models.shop);
    skuPrice.belongsTo(models.sku);
  };
  return skuPrice;
};