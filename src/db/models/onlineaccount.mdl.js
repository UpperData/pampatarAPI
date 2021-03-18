'use strict';
module.exports = (sequelize, DataTypes) => {
  const onLineAccount = sequelize.define('onLineAccount', {
    socialNetId: DataTypes.STRING,
    socialNetName: DataTypes.STRING,
    userId: DataTypes.STRING,
    accountId: DataTypes.INTEGER,
    dateTimeLogin: DataTypes.STRING
  }, {});
  onLineAccount.associate = function(models) {
    // associations can be defined here
  };
  return onLineAccount;
};