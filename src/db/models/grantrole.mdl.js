'use strict';
module.exports = (sequelize, DataTypes) => {
  const grantRole = sequelize.define('grantRole', {
    dashboradPermissionId: DataTypes.INTEGER,
    roleId: DataTypes.INTEGER,
    statusId: DataTypes.INTEGER
  }, {});
  grantRole.associate = function(models) {
    // associations can be defined here
  };
  return grantRole;
};