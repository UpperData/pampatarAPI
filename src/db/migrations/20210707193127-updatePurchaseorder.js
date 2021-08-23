module.exports = {
    up: async (queryInterface, Sequelize) => {
      const tableDefinition =  await queryInterface.describeTable('purchaseOrders');
      if (!tableDefinition.taxTypeId) {
          
          await queryInterface.addColumn('purchaseOrders', 'shopId', {
              type: Sequelize.INTEGER,
              allowNull: false
          });
      } 
            
      await queryInterface.addConstraint('purchaseOrders',['shopId'], {
          type: 'FOREIGN KEY',
          name: 'shop_purchaseOrder_fk', // useful if using queryInterface.removeConstraint
          references: {
          table: 'shops',
          field: 'id',
          },
          onDelete: 'no action',
          onUpdate: 'no action',
      })
      return Promise.resolve();
  },
    down: async (queryInterface, Sequelize) => {
          await queryInterface.removeConstraint('purchaseOrders', 'shop_purchaseOrder_fk');
          await queryInterface.removeColumn('purchaseOrders', 'shopId');
      }
  };