'use strict';
module.exports = (sequelize, DataTypes) => {
  const addressType = sequelize.define('addressType', {
    name: DataTypes.STRING
  }, {});
  addressType.associate = function(models) {
    // associations can be defined here
  };
  return addressType;
};