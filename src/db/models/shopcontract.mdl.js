'use strict';
module.exports = (sequelize, DataTypes) => {
  const shopContract = sequelize.define('shopContract', {
    contractId: {
      type:DataTypes.STRING,
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
    shopContract.belongsTo(models.attachment,{foreignkey:'contractId', as:'contract'} );
    shopContract.belongsTo(models.shop);
    models.shop.hasMany(shopContract);
    shopContract.belongsTo(models.Status,{foreignkey:'statusId', as:'status'});
  };
  return shopContract;
};