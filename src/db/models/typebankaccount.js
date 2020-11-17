'use strict';
module.exports = (sequelize, DataTypes) => {
  const typeBankAccount = sequelize.define('typeBankAccount', {
    name: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        isIn:[['Corriente','Ahorros']]
      }
    }
  }, {});
  typeBankAccount.associate = function(models) {
    // associations can be defined here
  };
  return typeBankAccount;
};