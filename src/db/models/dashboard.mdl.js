'use strict';
module.exports = (sequelize, DataTypes) => {
  const Dashboard = sequelize.define('Dashboards', {
    PermissionId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    subModuleId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    StatusId:{
      type:DataTypes.INTEGER,
      allowNull:false
    }

  }, {freezeTableName: true});
  Dashboard.associate = function(models) {
    // associations can be defined here  
    //Dashboard.belongsTo(models.subModule)
    Dashboard.belongsTo(models.Permission)
    Dashboard.belongsTo(models.subModule)
    Dashboard.belongsTo(models.Status)
    Dashboard.hasMany(models.grantRoles);
 
  };
  return Dashboard;
};