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
    statusId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    address: {
      type:DataTypes.JSONB,
      allowNull:false
    },
    phone: {
      type:DataTypes.JSONB,
      allowNull:false
    }
  }, {});
  Warehouse.associate = function(models) {
    // associations can be defined here   
    models.Status.belongsTo(models.Status,{foreignKey:'statusId', as:'statusWharehouse'});
  };
  return Warehouse;
};
