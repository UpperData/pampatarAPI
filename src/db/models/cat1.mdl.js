'use strict';
module.exports = (sequelize, DataTypes) => {
  const cat1 = sequelize.define('cat1', {
    name: {type:DataTypes.STRING}
  }, {});
  cat1.associate = function(models) {
    // associations can be defined here
    cat1.hasMany(models.cat2);
    
  };
  return cat1;
};