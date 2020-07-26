'use strict';
module.exports = (sequelize, DataTypes) => {
  const Status = sequelize.define('Status', {
    name:{
	type:DataTypes.STRING,
	allowNull:false,
	unique:true,
	validate:{
	    notEmpty:true,
	    isAlpha:true,
	    isIn:[['Active','Inactive']]
	}
    }
  }, {
	freezeTableName:true

});
  Status.associate = function(models) {
    // associations can be defined here
  };
  return Status;
};
