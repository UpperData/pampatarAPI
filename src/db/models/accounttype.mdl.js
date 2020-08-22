'use strict';
module.exports = (sequelize, DataTypes) => {
  const accountType = sequelize.define('accountType', {
    name: DataTypes.STRING
  }, {});
  accountType.associate = function(models) {
    // associations can be defined here
  };
  return accountType;
};