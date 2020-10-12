'use strict';
module.exports = (sequelize, DataTypes) => {
  const province = sequelize.define('provinces', {
    name: {
      type: DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
        notEmpty:true,
        len:[2,150]
      }
    },
    regionId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  province.associate = function(models) {
    // associations can be defined here
    province.belongsTo(models.region);
  };
  return province;
};