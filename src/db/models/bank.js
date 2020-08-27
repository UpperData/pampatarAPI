'use strict';
module.exports = (sequelize, DataTypes) => {
  const bank = sequelize.define('bank', {
    name: {
      type:DataTypes.STRING,
      allowNull:false
    },
    sbif: DataTypes.STRING,
    allowNull:false
  }, {});
  bank.associate = function(models) {
    // associations can be defined here
  };
  return bank;
};