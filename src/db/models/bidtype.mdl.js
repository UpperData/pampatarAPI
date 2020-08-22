'use strict';
module.exports = (sequelize, DataTypes) => {
  const bidType = sequelize.define('bidType', {
    name:      
    {
    type:DataTypes.STRING,
    allowNull:false,
    validate:{
      len:[10,20],
      isIn:[['Servicio','Producto']],
      notEmpty:true        
    }
  }
  }, {});
  bidType.associate = function(models) {
    // associations can be defined here
  };
  return bidType;
};