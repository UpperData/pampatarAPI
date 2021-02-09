'use strict';
module.exports = (sequelize, DataTypes) => {
  const purchaseOrder = sequelize.define('purchaseOrder', {
    AccountId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    shipping: {
      type:DataTypes.JSONB,
      allowNull:false
    }
  }, {});
  purchaseOrder.associate = function(models) {
    // associations can be defined here
    purchaseOrder.belongsTo(models.Account);
  };
  return purchaseOrder;
};