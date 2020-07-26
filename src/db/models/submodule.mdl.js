'use strict';
module.exports = (sequelize, DataTypes) => {
  const subModule = sequelize.define('subModule', {
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
  }, {freezeTableName: true});
  subModule.associate = function(models) {
    // associations can be defined here
    models.Status.belongsTo(models.Status,{foreignKey:'statusId', as:'statusSubModel'})
  };
  return subModule;
};