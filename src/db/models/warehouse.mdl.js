'use strict';
module.exports = (sequelize, DataTypes) => {
  const Warehouse = sequelize.define('Warehouse', {
    name: { 
      type:DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
        len:[4,60],
        notEmpty:true
      }
    },
    addressId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    statusId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  Warehouse.associate = function(models) {
    // associations can be defined here
    models.Address.belongsTo(models.Address,{foreignKey:'addressId', as:'addressWharehouse'});
    models.Status.belongsTo(models.Status,{foreignKey:'statusId', as:'statusWharehouse'});
  };
  return Warehouse;
};
