'use strict';
module.exports = (sequelize, DataTypes) => {
  const Gender = sequelize.define('Gender', {
    name:{
	type: DataTypes.STRING,
	allowNull:false,
	unique:true,
	validate:{
	    notEmpty:true,
	    isAlpha:true,
	    isIn:[['Hombre','Mujer']]
	}
    }
  }, {
	
});
  Gender.associate = function(models) {
    // associations can be defined here
  };
  return Gender;
};
