'use strict';
module.exports = (sequelize, DataTypes) => {
  const peopleType = sequelize.define('peopleType', {
    name:{
      type:DataTypes.STRING,
		  allowNull:false,
		  validate:{        
        isIn: [['Natural', 'Juridica']],  
        notEmpty: true
      }
    },
    statusId: {
      type: DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1 // Activo de forma predeterminada
    }
  }, {});
  peopleType.associate = function(models) {
    // associations can be defined here
    peopleType.belongsTo(models.Status)
  };
  return peopleType;
};