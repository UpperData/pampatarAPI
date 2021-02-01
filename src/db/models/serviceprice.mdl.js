'use strict';
module.exports = (sequelize, DataTypes) => {
  const servicePrice = sequelize.define('servicePrice', {
    serviceId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    shopId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    price: {
      type:DataTypes.DECIMAL,
      allowNull:false
      
    }
  }, {});
  servicePrice.associate = function(models) {
    // associations can be defined here
  };
  return servicePrice;
};