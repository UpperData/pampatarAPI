'use strict';
module.exports = (sequelize, DataTypes) => {
  const petittyon = sequelize.define('petittyon', {
    purchaseOrderId: DataTypes.INTEGER,
    items: DataTypes.JSONB,
    processed: DataTypes.BOOLEAN
  }, {});
  petittyon.associate = function(models) {
    // associations can be defined here
    petittyon.belongsTo(models.purchaseOrder);
  };
  return petittyon;
};