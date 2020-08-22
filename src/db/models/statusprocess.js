'use strict';
module.exports = (sequelize, DataTypes) => {
  const statusProcess = sequelize.define('statusProcess', {
    name: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        isIn:[['Pendiente','En Evaluación','Aprobado','Negado']],
        notEmpty: true
      }
   } 
  }, {});
  statusProcess.associate = function(models) {
    // associations can be defined here
  };
  return statusProcess;
};