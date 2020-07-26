'use strict';
module.exports = (sequelize, DataTypes) => {
  const address = sequelize.define('Address', {
    provinceId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    postalCodeId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },   
    street: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[3,100],
        notEmpty:true
      }
    },  
    description: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[3,400],
        notEmpty:true
      }
    },  
    statusId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  address.associate = function(models) {
    // associations can be defined here
    models.Provinces.belongsTo(models.Provinces,{foreignKey:'provinceId', as:'province'});
    models.postalCode.belongsTo(models.postalCode,{foreignKey:'postalCodeId', as:'postalCode'});
    models.Status.belongsTo(models.Status,{foreignKey:'statusId', as:'statusAddress'});
  };
  return address;
};