'use strict';
module.exports = (sequelize, DataTypes) => {
  const envoiceType = sequelize.define('envoiceType', {
    name: DataTypes.STRING
  }, {});
  envoiceType.associate = function(models) {
    // associations can be defined here
  };
  return envoiceType;
};