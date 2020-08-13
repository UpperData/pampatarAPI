'use strict';
module.exports = (sequelize, DataTypes) => {
  const comuna = sequelize.define('comuna', {
    name: DataTypes.STRING,
    provinceId: DataTypes.INTEGER
  }, {});
  comuna.associate = function(models) {
    // associations can be defined here
  };
  return comuna;
};