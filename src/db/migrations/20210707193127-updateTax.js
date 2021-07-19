module.exports = {
  up: async (queryInterface, Sequelize) => {
    const tableDefinition =  await queryInterface.describeTable('taxes');
    if (!tableDefinition.taxTypeId) {
        
        await queryInterface.addColumn('taxes', 'taxTypeId', {
            type: Sequelize.INTEGER,
        });
    }        
    await queryInterface.addConstraint('taxes',['taxTypeId'], {
        type: 'FOREIGN KEY',
        name: 'tax_taxSort_fk', // useful if using queryInterface.removeConstraint
        references: {
        table: 'taxTypes',
        field: 'id',
        },
        onDelete: 'no action',
        onUpdate: 'no action',
    })
    return Promise.resolve();
},
  down: async (queryInterface, Sequelize) => {
        await queryInterface.removeConstraint('taxTypes', 'tax_taxSort_fk');
        await queryInterface.removeColumn('taxes', 'taxTypeId');
    }
};