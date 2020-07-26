'use strict';
module.exports = (sequelize, DataTypes) => {
  const dashboardPermission = sequelize.define('dashboardPermission', {
    dashboardId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      unique:'dashboardPermissionsKey'
    },
    permissionId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      unique:'dashboardPermissionsKey'
    },
    statusId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1
    }
  }, {freezeTableName: true});
  dashboardPermission.associate = function(models) {
    // associations can be defined here
    models.Permision.belongsToMany(models.Dashboard, {as:'dashboardPermissionDash', through: dashboardPermission })
    models.Dashboard.belongsToMany(models.Permision, {as:'dashboardPermissionPerm', through: dashboardPermission })
    models.Status.belongsTo(models.Status,{foreignKey:'statusId', as:'statusdashboardPermission'})
  };
  return dashboardPermission;
};