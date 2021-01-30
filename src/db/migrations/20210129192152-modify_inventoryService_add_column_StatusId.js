'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return Promise.all([
      queryInterface.addColumn(
        'inventoryServices', // table name
        'StatusId', // new field name
        {
          type: Sequelize.INTEGER,
          allowNull: true,
          references:{
            model:{tableName:'Status',schema:'public'},
            key:'id'
          }          
        }
      )
    ])
   // queryInterface.addColumn('', '', { type: DataTypes.INTEGER,allowNull: true });
  },

  down: (queryInterface, Sequelize) => {
    queryInterface.removeColumn('inventoryService', 'StatusId');
  }
};
