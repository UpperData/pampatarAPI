'use strict';
module.exports = (sequelize, DataTypes) => {
  const subModule = sequelize.define('subModule', {
    name:{
      type: DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
          notEmpty:true,
          isAlpha:true
        }
    },
    ModuleId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    description:{
      type: DataTypes.STRING      
    } ,
    route:{
      type: DataTypes.STRING      
    },
    icon:{
      type: DataTypes.STRING      
    },
    StatusId:{
      type:DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1
    },
    sorting:{
      type: DataTypes.INTEGER      
    }
  });
  subModule.associate = function(models) {
    // associations can be defined here
    subModule.hasMany(models.Dashboards);
    subModule.belongsTo(models.Module);
    subModule.belongsTo(models.Status);
  };
  return subModule;
};