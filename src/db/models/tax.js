'use strict';
module.exports = (sequelize, DataTypes) => {
  const tax = sequelize.define('tax', {    
    name: {
      type:DataTypes.STRING,
      allowNull:false
    },
    value: {
      type:DataTypes.DECIMAL,
      allowNull:false  
    }
  }, {});
  tax.associate = function(models) {
    // associations can be defined here
  };
  return tax;
};