'use strict';
module.exports = (sequelize, DataTypes) => {
  const Permision = sequelize.define('Permision', {
    name:{
      type: DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
          notEmpty:true,
          isAlpha:true
        }
    },
    statusId:{
      type:DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1
    }
  },   {freezeTableName: true});
  Permision.associate = function(models) {
    // associations can be defined here
    models.Status.belongsTo(models.Status,{foreignKey:'statusId', as:'statusPermision'})
  };
  return Permision;
};