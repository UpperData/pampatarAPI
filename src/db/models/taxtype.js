'use strict';
module.exports = (sequelize, DataTypes) => {
  const taxType = sequelize.define('taxType', {
    name: DataTypes.STRING
  }, {});
  taxType.associate = function(models) {
    // associations can be defined here
  };
  return taxType;
};