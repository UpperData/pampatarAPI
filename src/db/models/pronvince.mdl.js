'use strict';
module.exports = (sequelize, DataTypes) => {
  const province = sequelize.define('provinces', {
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
  province.associate = function(models) {
    // associations can be defined here
    province.belongsTo(models.region)
  };
  return province;
};