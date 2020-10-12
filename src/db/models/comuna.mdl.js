'use strict';
module.exports = (sequelize, DataTypes) => {
  const comuna = sequelize.define('comuna', {
    name: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[1,100],	    
        notEmpty: true
      },
    provinceId: {
      type:DataTypes.INTEGER,
      allowNull:false    
    }
  }
} , {});
  comuna.associate = function(models) {
    // associations can be defined here
    comuna.belongsTo(models.provinces);
  };
  return comuna;
};