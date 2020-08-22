'use strict';
module.exports = (sequelize, DataTypes) => {
  const materials = sequelize.define('materials', {
    name: DataTypes.STRING
  }, {});
  materials.associate = function(models) {
    // associations can be defined here
  };
  return materials;
};