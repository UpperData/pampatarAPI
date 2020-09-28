'use strict';
module.exports = (sequelize, DataTypes) => {
  const grantRole = sequelize.define('grantRole', {
    dashboardPermissionId: DataTypes.INTEGER,
    RoleId: DataTypes.INTEGER,
    StatusId: DataTypes.INTEGER
  }, {});
  grantRole.associate = function(models) {
    // associations can be defined here
    grantRole.belongsTo(models.dashboardPermissions);
   // grantRole.hasMany(models.Roles)
    //grantRole.hasMany(models.Roles)
    grantRole.belongsTo(models.Status)
  };
  return grantRole;
};