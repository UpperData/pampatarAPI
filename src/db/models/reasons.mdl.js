'use strict';
module.exports = (sequelize, DataTypes) => {
  const reasons = sequelize.define('reasons', {
    name: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[1,100],
        notEmpty:true
      }
    }
  }, {});
  reasons.associate = function(models) {
    // associations can be defined here
  };
  return reasons;
};