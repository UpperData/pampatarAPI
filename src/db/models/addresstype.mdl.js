'use strict';
module.exports = (sequelize, DataTypes) => {
  const addressType = sequelize.define('addressType', {
    name: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
      len:[3,150],
      notEmpty:true
      }
    }
  }, {});
  addressType.associate = function(models) {
    // associations can be defined here
  };
  return addressType;
};