'use strict';
module.exports = (sequelize, DataTypes) => {
  const Roles = sequelize.define('Roles', {
    name:{ 
      type:DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
          len:[4,60],
          notEmpty:true
      }
    },
    StatusId:{
      type:DataTypes.INTEGER,
      allowNull:false
    }

  }, {});
  Roles.associate = function(models) {
    // associations can be defined here
    Roles.belongsTo(models.Status);
    //Roles.hasMany(models.grantRoles);
    models.accountRoles.belongsTo(Roles);
  };
  return Roles;
};
