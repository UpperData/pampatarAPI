'use strict';
module.exports = (sequelize, DataTypes) => {
  const addressAccount = sequelize.define('addressAccount', {
    addressId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    accountId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    addressTypeId: {
      type:DataTypes.INTEGER,
      allowNull:false
    } ,
    statusId: {
      type:DataTypes.INTEGER,
      allowNull:false
    } 
  }, {    
    indexes: [
    {
      unique: true,
      fields: ['accountId', 'addressId']
    }
  ]});
  addressAccount.associate = function(models) {
    // associations can be defined here
    models.addressType.belongsTo(models.addressType,{foreignKey:'addressTypeId', as:'addressType'});
    models.Address.belongsToMany(models.Account,{through:addressAccount,as:"accountAddresses"});
    models.Account.belongsToMany(models.Address,{through:addressAccount,as:"addressAccounts"});
    models.Status.belongsTo(models.Status,{foreignKey:'statusId', as:'statusAddressAccounts'});
  };
  return addressAccount;
};