'use strict';
module.exports = (sequelize, DataTypes) => {
  const shopContract = sequelize.define('shopContract', {
    contractId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    shopId: {      
      type:DataTypes.INTEGER,
      allowNull:false
    },
    contractDesc:{
      type:DataTypes.JSONB,
      allowNull:false
    },
    proPercen:{
      type:DataTypes.DECIMAL(5,2),
      allowNull:false
    },
    servPercen:{
      type:DataTypes.DECIMAL(5,2),
      allowNull:false
    },
    statusId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  shopContract.associate = function(models) {
    // associations can be defined here
    shopContract.belongsTo(models.attachment, {foreignkey:'contractId'});
    shopContract.belongsTo(models.shop);
    shopContract.belongsTo(models.Status, {foreignkey:'statusId'});
  };
  return shopContract;
};