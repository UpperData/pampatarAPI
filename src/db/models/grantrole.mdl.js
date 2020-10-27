'use strict';
module.exports = (sequelize, DataTypes) => {
  const grantRoles = sequelize.define('grantRoles', {
    DashboardId: DataTypes.INTEGER,
    RoleId: DataTypes.INTEGER,
    StatusId: DataTypes.INTEGER
  }, {});
  grantRoles.associate = function(models) {
    // associations can be defined here
    grantRoles.belongsTo(models.Dashboards);
    grantRoles.belongsTo(models.Roles)
    //grantRoles.hasMany(models.Roles)
    grantRoles.belongsTo(models.Status)
  };
  return grantRoles;
};