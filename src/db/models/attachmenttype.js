'use strict';
module.exports = (sequelize, DataTypes) => {
  const attachmentType = sequelize.define('attachmentType', {
    name: DataTypes.STRING
  }, {});
  attachmentType.associate = function(models) {
    // associations can be defined here
  };
  return attachmentType;
};