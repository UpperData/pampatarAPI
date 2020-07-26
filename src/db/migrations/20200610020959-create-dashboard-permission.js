'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('dashboardPermissions', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      dashboardId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
        references:{
          model:{tableName:'Dashboards',schema: 'public'},
          key:'id'
        },unique:'dashboardPermissionsKey'
      },
      permissionId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
        references:{
          model:{tableName:'Permissions',schema: 'public'},
          key:'id'
        },unique:'dashboardPermissionsKey'
      },
      statusId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
        references:{
          model:{tableName:'Status',schema: 'public'},
          key:'id'
        }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    }, {
      uniqueKeys: {
        dashboardPermissionsKey: {
          customIndex: true,
          fields: ["permissionId","dashboardId"]
        }
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('dashboardPermissions');
  }
};