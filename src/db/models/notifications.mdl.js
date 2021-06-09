'use strict';
module.exports = (sequelize, DataTypes) => {
  const notifications = sequelize.define('notifications', {
    from: {
      type:DataTypes.STRING,
      allowNull:false
    },
    body: {
      type:DataTypes.JSONB,
      allowNull:false
    },
    read: {
      type:DataTypes.BOOLEAN,
      allowNull:false
    },
    accountRolesId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  notifications.associate = function(models) {
    // associations can be defined here
    notifications.belongsTo(models.accountRoles)
  };
  return notifications;
};