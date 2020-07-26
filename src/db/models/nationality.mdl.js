'use strict';
module.exports = (sequelize, DataTypes) => {
  const Natinality = sequelize.define('Nationalities', {
    name:{
	type: DataTypes.STRING,
	allowNull:false,
	unique:true,
	validate:{
	    notEmpty:true,
	    isAlpha:true,
	    isIn:[['Nacional','Extranjera']]
	}
    }
  }, {});
  Natinality.associate = function(models) {
    // associations can be defined here
  };
  return Natinality;
};
