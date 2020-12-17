'use strict';
module.exports = (sequelize, DataTypes) => {
  const tax = sequelize.define('tax', {    
    name: {
      type:DataTypes.STRING,
      allowNull:false
    }
  }, {});
  tax.associate = function(models) {
    tax.hasMany(models.taxValue);
    // associations can be defined here
  };
  return tax;
};