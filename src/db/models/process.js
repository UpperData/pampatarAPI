'use strict';
module.exports = (sequelize, DataTypes) => {
  const process = sequelize.define('process', {
    name: DataTypes.STRING
  }, {});
  process.associate = function(models) {
    // associations can be defined here
  };
  return process;
};