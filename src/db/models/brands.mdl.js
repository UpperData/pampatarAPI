'use strict';
module.exports = (sequelize, DataTypes) => {
  const brands = sequelize.define('Brands', {
    name: DataTypes.STRING
  }, {});
  brands.associate = function(models) {
    // associations can be defined here
  };
  return brands;
};