'use strict';
module.exports = (sequelize, DataTypes) => {
  const inventoryTransaction = sequelize.define('inventoryTransaction', {
    type: {
      type:DataTypes.STRING,      
      allowNull:false,
      validate:{
        isIn:[['out','in']]
      }
    },
    quantity: {
      type:DataTypes.DECIMAL,
      allowNull:false,
    },
    inventoryId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    AccountId: {
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  inventoryTransaction.associate = function(models) {
    // associations can be defined here
    inventoryTransaction.belongsTo(models.inventory);
    inventoryTransaction.belongsTo(models.Account);
  };
  return inventoryTransaction;
};