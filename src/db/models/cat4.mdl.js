'use strict';
module.exports = (sequelize, DataTypes) => {
  const cat4 = sequelize.define('cat4', {
    name: DataTypes.STRING,
    cat3Id: DataTypes.INTEGER
  }, {});
  cat4.associate = function(models) {
    // associations can be defined here
    cat4.belongsTo(models.cat3);
  };
  return cat4;
};