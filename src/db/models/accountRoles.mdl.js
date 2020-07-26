'use strict';
module.exports = (sequelize, DataTypes) => {
  const accountRoles = sequelize.define('accountRoles', {
    accountId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      unique:'accountRolesUQ'
    },
    roleId:{
      type:DataTypes.INTEGER,
      allowNull:false,
      unique:'accountRolesUQ'
    },
    statusId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1
    }
  }, {freezeTableName:true
  });
  accountRoles.associate = function(models) {
    // associations can be defined here
    //models.Account.belongsToMany(models.Roles,{through:accountRoles,as:"Roles"});
    //accountRoles.belongsToMany(models.Account,{through:accountRoles,as:"Accounts"});
    models.Status.belongsTo(models.Status,{foreignKey:'statusId', as:'status'});
  };
  return accountRoles;
};
