'use strict';
module.exports = (sequelize, DataTypes) => {
  const docType = sequelize.define('docType', {
    name: {
    	 type:DataTypes.STRING,
	    allowNull:false,
	    validate:{
			isIn: [['RUT','RUN','DNI','PASAPORTE']],    
	    }
    },
    peopleTypeId:{
      type:DataTypes.INTEGER,
		  allowNull:false
    }
  }, {});
  docType.associate = function(models) {
    // associations can be defined here
    docType.belongsTo(models.peopleType);
  };
  return docType;
};