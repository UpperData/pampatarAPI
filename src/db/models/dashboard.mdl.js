'use strict';
module.exports = (sequelize, DataTypes) => {
  const dashboard = sequelize.define('Dashboard', {
    moduleId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    subModuleId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {freezeTableName: true});
  dashboard.associate = function(models) {
    // associations can be defined here  
    models.Module.belongsToMany(models.subModule, {as:'dashboardSub', through: dashboard })
    models.subModule.belongsToMany(models.Module, {as:'dashboardMod', through: dashboard })
  };
  return dashboard;
};