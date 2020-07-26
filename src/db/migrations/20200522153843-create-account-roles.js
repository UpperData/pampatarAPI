'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('accountRoles', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      accountId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
	      references:{model:{tableName:'Accounts',schema:'public'},key:'id'}
      },
      roleId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
	      references:{model:{tableName:'Roles',schema:'public'},key:'id'}
      },
      statusId: {
        type: Sequelize.INTEGER,
      	allowNull:false,
	      references:{model:{tableName:'Status',schema:'public'},key:'id'}
      },
      preference:{
        type:Sequelize.TEXT
      },
      hashConfirm:{
        type:Sequelize.TEXT,
        allowNull:false
      },
      confirmStatus:{
        type:Sequelize.BOOLEAN,
        allowNull:false,
        defaultValue:false
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
        accountRolesKey: {
          customIndex: true,
          fields: ["accountId","roleId"]
        }
      }
    }
    );
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('accountRoles');
  }
};
