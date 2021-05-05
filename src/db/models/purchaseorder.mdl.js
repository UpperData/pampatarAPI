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
    },
    pay:{
      type:DataTypes.JSONB,
      allowNull:false
    },
    people:{
      type:DataTypes.JSONB,
      allowNull:false
    },
    seller:{
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