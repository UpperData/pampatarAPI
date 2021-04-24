'use strict';
module.exports = (sequelize, DataTypes) => {
  const attachmenType = sequelize.define('attachmenType', {
    name: DataTypes.STRING
  }, {});
  attachmenType.associate = function(models) {
    // associations can be defined here
  };
  return attachmenType;
};