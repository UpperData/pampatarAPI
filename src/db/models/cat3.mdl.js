'use strict';
module.exports = (sequelize, DataTypes) => {
  const cat3 = sequelize.define('cat3', {
    name: DataTypes.STRING,
    cat2Id: DataTypes.INTEGER
  }, {});
  cat3.associate = function(models) {
    // associations can be defined here
    cat3.belongsTo(models.cat2)
    cat3.hasMany(models.cat4);
  };
  return cat3;
};