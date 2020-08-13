'use strict';
module.exports = (sequelize, DataTypes) => {
  const processType = sequelize.define('processType', {
    name: DataTypes.STRING
  }, {});
  processType.associate = function(models) {
    // associations can be defined here
  };
  return processType;
};