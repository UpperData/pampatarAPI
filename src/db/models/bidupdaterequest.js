'use strict';
module.exports = (sequelize, DataTypes) => {
  const bidUpdateRequest = sequelize.define('bidUpdateRequest', {
    shopId:{
      type:DataTypes.INTEGER,
      allowNull:false
    },
    bidId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    change: {
      type:DataTypes.JSONB,
      allowNull:false},
    statusProcessId:{
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  bidUpdateRequest.associate = function(models) {
    // associations can be defined here
    bidUpdateRequest.belongsTo(models.Bids);
  };
  return bidUpdateRequest;
};