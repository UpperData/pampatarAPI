'use strict';
module.exports = (sequelize, DataTypes) => {
  const Subscribe = sequelize.define('Subscribes', {
    email:{
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        isEmail:true
      }
    },
      hashConfirm:{
      type:DataTypes.JSONB,
      allowNull:true      
    	}
  }, {freezeTableName:true});
  Subscribe.associate = function(models) {
    // associations can be defined here
  };
  return Subscribe;
};