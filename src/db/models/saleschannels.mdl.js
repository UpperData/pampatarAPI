'use strict';
module.exports = (sequelize, DataTypes) => {
  const salesChannels = sequelize.define('salesChannels', {
    name: {
    	 type:DataTypes.STRING,
	    allowNull:false,
	    validate:{
			isIn: [['REDES SOCIALES','PERSONAL','OTRO MARKET PLACE','ALIADO COMERCIAL','OTRO MEDIO']],    
	    }
 	 }
  }, {});
  salesChannels.associate = function(models) {
    // associations can be defined here
  };
  return salesChannels;
};

