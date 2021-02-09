'use strict';
module.exports = (sequelize, DataTypes) => {
  const statusTracking = sequelize.define('statusTracking', {
    name: {
      type:DataTypes.STRING,
      allowNull:false
    }
  }, {});
  statusTracking.associate = function(models) {
    // associations can be defined here
  };
  return statusTracking;
};