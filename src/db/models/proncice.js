'use strict';
module.exports = (sequelize, DataTypes) => {
  const proncice = sequelize.define('proncice', {
    name: DataTypes.STRING,
    regionId: DataTypes.INTEGER
  }, {});
  proncice.associate = function(models) {
    // associations can be defined here
  };
  return proncice;
};