'use strict';
module.exports = (sequelize, DataTypes) => {
  const skuType = sequelize.define('skuType', {
    name: {
      type:DataTypes.STRING,
      allowNull:false
    }
  }, {});
  skuType.associate = function(models) {
    // associations can be defined here
  };
  return skuType;
};