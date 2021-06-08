'use strict';
module.exports = (sequelize, DataTypes) => {
  const purchaseOrder = sequelize.define('purchaseOrder', {
    shoppingcarId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },shipping: {
      type:DataTypes.JSONB,
      allowNull:false
    },items:{
      type:DataTypes.JSONB,
      allowNull:false
    },pay:{
      type:DataTypes.JSONB,
      allowNull:false,
      defaultValue:[]
    },people:{
      type:DataTypes.JSONB,
      allowNull:false
    },seller:{
      type:DataTypes.JSONB,
      allowNull:false
    },statusTrackingId:{
      type:DataTypes.INTEGER,
      allowNull:false,
      defaultValue:1
    },historyStatus:{
      type:DataTypes.JSONB,
      allowNull:false
    },invoice:{
      type:DataTypes.JSONB,
      allowNull:false
    }
  }, {});
  purchaseOrder.associate = function(models) {
    // associations can be defined here
    purchaseOrder.belongsTo(models.shoppingcar);
  };
  return purchaseOrder;
};