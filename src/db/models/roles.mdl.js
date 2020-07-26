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
    statusId:{
      type:DataTypes.INTEGER,
      allowNull:false
    }

  }, {});
  Roles.associate = function(models) {
    // associations can be defined here
    models.Roles.belongsTo(models.Status,{foreignKey:'statusId',as:'status'});
  };
  return Roles;
};
