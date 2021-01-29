'use strict';
module.exports = (sequelize, DataTypes) => {
  const inventoryServiceTransaction = sequelize.define('inventoryServiceTransaction', {
    type: {
      type:DataTypes.STRING,      
      allowNull:false,
      validate:{
        isIn:[['out','in']]
      }      
    },
    quantity: {
      type:DataTypes.DECIMAL,      
      allowNull:false
    },
    inventoryServiceId: {
      type:DataTypes.INTEGER,      
      allowNull:false
    },
    AccountId: {
      type:DataTypes.INTEGER,      
      allowNull:false
    }
  }, {});
  inventoryServiceTransaction.associate = function(models) {
    // associations can be defined here
    inventoryServiceTransaction.belongsTo(models.inventoryService);
    inventoryServiceTransaction.belongsTo(models.Account);
  };
  return inventoryServiceTransaction;
};