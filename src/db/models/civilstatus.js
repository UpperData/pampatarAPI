'use strict';
module.exports = (sequelize, DataTypes) => {
  const civilStatus = sequelize.define('civilStatus', {
    name: DataTypes.STRING
  }, {});
  civilStatus.associate = function(models) {
    // associations can be defined here
  };
  return civilStatus;
};