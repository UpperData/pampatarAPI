//queryInterface.addIndex('Person', ['firstname', 'lastname'])

// This example will create a unique index with the name SuperDuperIndex using the optional 'options' field.
// Possible options:
// - indicesType: UNIQUE|FULLTEXT|SPATIAL
// - indexName: The name of the index. Default is __
// - parser: For FULLTEXT columns set your parser
// - indexType: Set a type for the index, e.g. BTREE. See the documentation of the used dialect
// - logging: A function that receives the sql query, e.g. console.log
'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addIndex(
  'accountRoles',
  ['accountId', 'roleId'],
  {
    indexName: 'accountRolesKey',
    indicesType: 'UNIQUE'
  }
)  },
down: (queryInterface, Sequelize) => {
  return queryInterface.index('accountRolesKey');
}
}