'use strict';
module.exports = (sequelize, DataTypes) => {
  const postalCode = sequelize.define('postalCode', {
    name:{
      type: DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
          notEmpty:true         
      }
    }
  }, {});
  postalCode.associate = function(models) {
    // associations can be defined here
  };
  return postalCode;
};