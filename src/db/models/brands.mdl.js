'use strict';
module.exports = (sequelize, DataTypes) => {
  const brands = sequelize.define('brands', {
    name: DataTypes.STRING
  }, {});
  brands.associate = function(models) {
    // associations can be defined here
  };
  return brands;
};