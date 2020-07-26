'use strict';
module.exports = (sequelize, DataTypes) => {
  const province = sequelize.define('Provinces', {
    name: {
      type: DataTypes.STRING,
      allowNull:false,
      unique:true,
      validate:{
        notEmpty:true,
        len:[2,150]
      }
    },
    countryId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  province.associate = function(models) {
    // associations can be defined here
    models.Country.belongsTo(models.Country,{foreignKey:'countryId', as:'provincesCountry'});
  };
  return province;
};