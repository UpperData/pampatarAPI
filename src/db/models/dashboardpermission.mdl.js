'use strict';
module.exports = (sequelize, DataTypes) => {
  const dashboardPermissions = sequelize.define('dashboardPermissions', {
    DashboardId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      unique:'dashboardPermissionsKey'
    },
    PermissionId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      unique:'dashboardPermissionsKey'
    },
    StatusId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1
    }
  }, {freezeTableName: true});
  dashboardPermissions.associate = function(models) {
    // associations can be defined here
    //models.Permision.belongsToMany(models.Dashboard, {as:'dashboardPermissionDash', through: dashboardPermission })
    //models.Dashboard.belongsToMany(models.Permision, {as:'dashboardPermissionPerm', through: dashboardPermission })
   // dashboardPermissions.belongsTo(models.Permission)
   // dashboardPermissions.belongsTo(models.Dashboards)
    dashboardPermissions.hasMany(models.grantRole)
    dashboardPermissions.belongsTo(models.Dashboards)
    dashboardPermissions.belongsTo(models.Status)
  };
  return dashboardPermissions;
};