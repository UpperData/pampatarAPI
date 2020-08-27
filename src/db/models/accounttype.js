'use strict';
module.exports = (sequelize, DataTypes) => {
  const accountType = sequelize.define('accountType', {
    name: {
      type:DataTypes.STRING,
      allowNull:false
    }
  }, {});
  accountType.associate = function(models) {
    // associations can be defined here
  };
  return accountType;
};