'use strict';
module.exports = (sequelize, DataTypes) => {
  const region = sequelize.define('region', {
    name: DataTypes.STRING,
    ordinal: DataTypes.STRING
  }, {});
  region.associate = function(models) {
    // associations can be defined here
  };
  return region;
};