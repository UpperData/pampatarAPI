'use strict';
module.exports = (sequelize, DataTypes) => {
  const taxValue = sequelize.define('taxValue', {
    taxId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    value: {
      type:DataTypes.DECIMAL,
      allowNull:false
    },
    StatusId:{
      type:DataTypes.INTEGER,
      allowNull:false
    }

  }, {});
  taxValue.associate = function(models) {
    // associations can be defined here
    taxValue.belongsTo(models.tax);
    taxValue.belongsTo(models.Status);
    taxValue.belongsTo(models.tax);
    
  };
  return taxValue;
};