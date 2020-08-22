'use strict';
module.exports = (sequelize, DataTypes) => {
  const disponibility = sequelize.define('disponibility', {
    name: DataTypes.STRING
  }, {});
  disponibility.associate = function(models) {
    // associations can be defined here
  };
  return disponibility;
};