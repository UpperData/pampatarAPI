'use strict';
module.exports = (sequelize, DataTypes) => {
  const petittyon = sequelize.define('petittyon', {
    purchaseOrderId: {
      type: DataTypes.INTEGER,
      allowNull:false
    },
    items: {
      type: DataTypes.JSONB,
      allowNull:false
    },
    processed:{
      type: DataTypes.BOOLEAN,
      allowNull:false
    },
    shopId:{
      type: DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  petittyon.associate = function(models) {
    // associations can be defined here
    petittyon.belongsTo(models.purchaseOrder);
  };
  return petittyon;
};