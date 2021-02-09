'use strict';
module.exports = (sequelize, DataTypes) => {
  const tracking = sequelize.define('tracking', {
    statusTrackingId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    location: {
      type:DataTypes.STRING,
      allowNull:false
    },
    purchaseOrderId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  tracking.associate = function(models) {
    // associations can be defined here
    tracking.belongsTo(models.statusTracking);
    tracking.belongsTo(models.purchaseOrder);

  };
  return tracking;
};