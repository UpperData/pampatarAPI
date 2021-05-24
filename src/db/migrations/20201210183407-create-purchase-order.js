'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('purchaseOrders', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      shoppingcarId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references:{
          model:{tableName:'shoppingcars', schema:'public'},
          key:'id'
        }
      },shipping: {
        type: Sequelize.JSONB,
        allowNull: false
      },items: {
        type: Sequelize.JSONB,
        allowNull: false
      },pay: {
        type: Sequelize.JSONB,
        allowNull: true,
        defaultValue:[]
      },people: {
        type: Sequelize.JSONB,
        allowNull: false
      },seller: {
        type: Sequelize.JSONB,
        allowNull: false
      },statusTrackingId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references:{
          model:{tableName:'Accounts', schema:'public'},
          key:'id'
        }
      },historyStatus: {
        type: Sequelize.JSONB,
        allowNull: false
      },createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('purchaseOrders');
  }
};

/* UPDATE
alter table "purchaseOrders" add column "items" jsonb not null;
alter table "purchaseOrders" add column "pay" jsonb not null;
alter table "purchaseOrders" add column "people" jsonb not null;
alter table "purchaseOrders" add column "seller" jsonb not null;
alter table "purchaseOrders" add column "statusTrackingId" integer not null;
alter table "purchaseOrders" add column "historyStatus" jsonb not null;
alter table "purchaseOrders" add constraint "purchase_statusTrackingId" foreign key("statusTrackingId") references "statusTrackings"("id");



*/