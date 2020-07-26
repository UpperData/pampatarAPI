'use strict';
module.exports = (sequelize, DataTypes) => {
  const Products = sequelize.define('Products', {
    name: {
      type: DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
        notEmpty:true,
        len:[2,150]
      }
    }
  }, {});
  Products.associate = function(models) {
    // associations can be defined here
  };
  return Products;
};