'use strict';
module.exports = (sequelize, DataTypes) => {
  const Permission = sequelize.define('Permission', {
    name:{
      type: DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
          notEmpty:true,
          isAlpha:true
        }
    },
    StatusId:{
      type:DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1
    }
  },   );
  Permission.associate = function(models) {
    // associations can be defined here
    Permission.belongsTo(models.Status)
  };
  return Permission;
};