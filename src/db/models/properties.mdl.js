'use strict';
module.exports = (sequelize, DataTypes) => {
  const Properties = sequelize.define('Properties', {
    name:{
      type: DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
        notEmpty:true,
        len:[2,150]
      }
    }
  }, {});
  Properties.associate = function(models) {
    // associations can be defined here
  };
  return Properties;
};