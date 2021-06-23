'use strict';
module.exports = (sequelize, DataTypes) => {
  const service = sequelize.define('service', {
    name: {
      type:DataTypes.STRING,
      allowNull:false
    },
    shopId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  service.associate = function(models) {
    // associations can be defined here
    service.belongsTo(models.shop);
    service.hasMany(models.servicePrice);
    service.hasMany(models.inventoryService);
  };
  return service;
};