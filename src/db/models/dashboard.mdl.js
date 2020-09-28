'use strict';
module.exports = (sequelize, DataTypes) => {
  const Dashboard = sequelize.define('Dashboards', {
    ModuleId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    subModuleId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    StatusId:{
      type:DataTypes.INTEGER,
      allowNull:false
    }

  }, {freezeTableName: true});
  Dashboard.associate = function(models) {
    // associations can be defined here  
    //Dashboard.belongsTo(models.subModule)
    Dashboard.hasMany(models.dashboardPermissions)
    Dashboard.belongsTo(models.Module)
    Dashboard.belongsTo(models.Status)
  };
  return Dashboard;
};