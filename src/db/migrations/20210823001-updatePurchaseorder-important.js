module.exports = {
    up: async (queryInterface, Sequelize) => {
      const tableDefinition =  await queryInterface.describeTable('purchaseOrders');
      
        if (!tableDefinition.items) {
            await queryInterface.addColumn('purchaseOrders', 'items', {
                type: Sequelize.JSONB,
                allowNull: false
                
            });
        }  
        if (!tableDefinition.people) {
            await queryInterface.addColumn('purchaseOrders', 'people', {
                type: Sequelize.JSONB,
                allowNull: false
            });
        }
        if (!tableDefinition.seller) {
            await queryInterface.addColumn('purchaseOrders', 'seller', {
                type: Sequelize.JSONB,
                allowNull: false
            });
        }
        if (!tableDefinition.historyStatus) {
            await queryInterface.addColumn('purchaseOrders', 'historyStatus', {
                type: Sequelize.JSONB,
                allowNull: false
            });
        }
        if (!tableDefinition.statusTrackingId) {
            await queryInterface.addColumn('purchaseOrders', 'statusTrackingId', {
                type: Sequelize.INTEGER,
                allowNull: false
            });
            await queryInterface.addConstraint('purchaseOrders',['statusTrackingId'], {
                type: 'FOREIGN KEY',
                name: 'statusTracking_purchaseOrder_fk', // useful if using queryInterface.removeConstraint
                references: {
                table: 'statusTrackings',
                field: 'id',
                },
                onDelete: 'no action',
                onUpdate: 'no action',
            })
        }
        if (!tableDefinition.shoppingcarId) {
            await queryInterface.addColumn('purchaseOrders', 'shoppingcarId', {
                type: Sequelize.INTEGER,
                allowNull: false
            });
            await queryInterface.addConstraint('purchaseOrders',['shoppingcarId'], {
                type: 'FOREIGN KEY',
                name: 'shoppingcar_purchaseOrder_fk', // useful if using queryInterface.removeConstraint
                references: {
                table: 'shoppingcars',
                field: 'id',
                },
                onDelete: 'no action',
                onUpdate: 'no action',
            })
        }
        if (!tableDefinition.AccountId) {
            await queryInterface.addColumn('purchaseOrders', 'AccountId', {
                type: Sequelize.INTEGER,
                allowNull: false
            });
            await queryInterface.addConstraint('purchaseOrders',['AccountId'], {
                type: 'FOREIGN KEY',
                name: 'Account_purchaseOrder_fk', // useful if using queryInterface.removeConstraint
                references: {
                table: 'Accounts',
                field: 'id',
                },
                onDelete: 'no action',
                onUpdate: 'no action',
            })
        }
      return Promise.resolve();
  },
    down: async (queryInterface, Sequelize) => {
          
          await queryInterface.removeColumn('purchaseOrders', 'pay');
      }
  };