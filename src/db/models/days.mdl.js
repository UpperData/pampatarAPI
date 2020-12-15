'use strict';
module.exports = (sequelize, DataTypes) => {
  const days = sequelize.define('days', {
    name: DataTypes.STRING
  }, {});
  days.associate = function(models) {
    // associations can be defined here
  };
  return days;
};