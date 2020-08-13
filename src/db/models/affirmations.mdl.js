'use strict';
module.exports = (sequelize, DataTypes) => {
  const affirmations = sequelize.define('affirmations', {
    name: {
	    type:DataTypes.STRING,
	    allowNull:false,
	    validate:{
			len: [5,700]    
	    }
    }
  }, {});
  affirmations.associate = function(models) {
    // associations can be defined here
  };
  return affirmations;
};