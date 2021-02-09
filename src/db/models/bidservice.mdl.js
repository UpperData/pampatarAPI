'use strict';
module.exports = (sequelize, DataTypes) => {
  const bidService = sequelize.define('bidService', {
    skuId: DataTypes.INTEGER,
    title: DataTypes.STRING,
    photos: DataTypes.JSONB,
    videos: DataTypes.JSONB,
    longDesc: DataTypes.TEXT,
    smallDesc: DataTypes.STRING,
    tags: DataTypes.JSONB,
    category: DataTypes.JSONB,
    materials: DataTypes.INTEGER,
    quantity: DataTypes.INTEGER,
    serviceType: DataTypes.INTEGER,
    disponibility: DataTypes.INTEGER,
    shedule: DataTypes.JSONB,
    discount: DataTypes.DECIMAL
  }, {});
  bidService.associate = function(models) {
    // associations can be defined here
  };
  return bidService;
};