'use strict';
module.exports = (sequelize, DataTypes) => {
  const processType = sequelize.define('processType', {
    name: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[1,80],	    
        notEmpty: true
      }
    
    }
  }, {});
  processType.associate = function(models) {
    // associations can be defined here
  };
  return processType;
};