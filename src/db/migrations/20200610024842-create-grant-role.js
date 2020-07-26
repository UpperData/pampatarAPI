'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('grantRoles', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      dashboradPermissionId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
        references:{
          model:{tableName:'dashboardPermissions',schema: 'public'},
          key:'id'
        },
        unique:'grantRolesKey'
      },
      roleId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
        references:{
          model:{tableName:'Roles',schema: 'public'},
          key:'id'
        },
        unique:'grantRolesKey'
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
    },
      {
        uniqueKeys: {
          actions_unique: {
            customIndex: true,
            fields: ['roleId', 'dashboradPermissionId']
        }
        }
      }
    );
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('grantRoles');
  }
};