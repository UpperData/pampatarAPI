'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('Dashboards', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      moduleId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
        references:{
          model:{tableName:'Modules',schema: 'public'},
          key:'id'
        },
        unique: "dashboardKey"
      },
      subModuleId: {
        type: Sequelize.INTEGER,
	      allowNull:false,
        references:{
          model:{tableName:'subModules',schema: 'public'},
          key:'id'
        },
        unique: "dashboardKey"
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
        dashboardKey: {
          customIndex: true,
          fields: ["subModuleId","moduleId"]
        }
      }
    }
    
    
    );
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('Dashboards');
  }
};