'use strict';
module.exports = (sequelize, DataTypes) => {
  const region = sequelize.define('region', {
    name: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[1,100],	    
        notEmpty: true
      }
    
    },
    ordinal: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[1,20],	    
        notEmpty: true
      }
    }
  }, {});
  region.associate = function(models) {
    // associations can be defined here
  };
  return region;
};