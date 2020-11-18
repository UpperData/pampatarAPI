'use strict';
module.exports = (sequelize, DataTypes) => {
  const serviceType = sequelize.define('serviceType', {
    name: DataTypes.STRING
  }, {});
  serviceType.associate = function(models) {
    // associations can be defined here
  };
  return serviceType;
};