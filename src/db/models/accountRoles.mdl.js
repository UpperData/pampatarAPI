'use strict';
module.exports = (sequelize, DataTypes) => {
  const accountRoles = sequelize.define('accountRoles', {
    AccountId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      unique:'accountRolesUQ'
    },
    RoleId:{
      type:DataTypes.INTEGER,
      allowNull:false,
      unique:'accountRolesUQ'
    },
    StatusId: {
      type:DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1
    }
  }//,{  freezeTableName: true} 
  );
  accountRoles.associate = function(models) {
    // associations can be defined here
    accountRoles.belongsTo(models.Status);
    accountRoles.belongsTo(models.Account);
    accountRoles.belongsTo(models.Roles);
   // models.Roles.belongsToMany(models.Account, {through:accountRoles});
   // models.Account.belongsToMany(models.Roles, {through:accountRoles});    
    
  };
  return accountRoles;
};
