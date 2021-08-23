module.exports = {
    up: async (queryInterface, Sequelize) => {
      const tableDefinition =  await queryInterface.describeTable('purchaseOrders');
      
      if (!tableDefinition.pay) {
          
        await queryInterface.addColumn('purchaseOrders', 'pay', {
            type: Sequelize.JSONB,
            allowNull: false
        });
       }        
      
      return Promise.resolve();
  },
    down: async (queryInterface, Sequelize) => {
          
          await queryInterface.removeColumn('purchaseOrders', 'pay');
      }
  };