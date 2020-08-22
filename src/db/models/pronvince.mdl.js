'use strict';
module.exports = (sequelize, DataTypes) => {
  const pronvince = sequelize.define('pronvince', {
    name: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[1,100],	    
        notEmpty: true
      }
    
    },
    regionId: {
      type:DataTypes.INTEGER,
      allowNull:false    
    }
  }, {});
  pronvince.associate = function(models) {
    // associations can be defined here
  };
  return pronvince;
};