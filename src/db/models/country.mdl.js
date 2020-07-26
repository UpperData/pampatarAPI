'use strict';
module.exports = (sequelize, DataTypes) => {
  const Country = sequelize.define('Country', {
    name: {
      type:DataTypes.STRING,
      allowNull:false,
      unique:true,
      validation:{
        len:[2,100],
        isAlpha:true,
        notEmpty: true
      }
    }
  }, {});
  Country.associate = function(models) {
    // associations can be defined here
  };
  return Country;
};