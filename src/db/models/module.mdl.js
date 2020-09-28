'use strict';
module.exports = (sequelize, DataTypes) => {
  const Module = sequelize.define('Module', {
    name:{
      type: DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
          notEmpty:true,
          isAlpha:true
        }
    },
    StatusId:{
      type:DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1
    }
  }, );
  Module.associate = function(models) {
    // associations can be defined here
    Module.hasMany(models.Dashboards);
    Module.hasMany(models.subModule);
    Module.belongsTo(models.Status);
  };
  return Module;
};