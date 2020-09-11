'use strict';
module.exports = (sequelize, DataTypes) => {
  const cat2 = sequelize.define('cat2', {
    name: {
      type:DataTypes.STRING,
      allowNull:false
    },
    cat1Id: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  cat2.associate = function(models) {
    // associations can be defined here
   cat2.belongsTo(models.cat1,{foreignKey:'cat1Id'});
  };
  return cat2;
};