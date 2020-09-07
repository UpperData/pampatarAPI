'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('envoiceNotifies', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      envoiceTypeId:{
        type: Sequelize.INTEGER,
        references:{model:{tableName:'envoiceTypes',shema:'public'},key:'id'}
      },
      envoiceNum: {
        type: Sequelize.INTEGER,
        allowNull:false
      },
      dateNotify: {
        type: Sequelize.DATE,
        allowNull:false
      },
      deliveryId: {  //Numero de perdido
        type: Sequelize.INTEGER,
        references:{model:{tableName:'deliveries',shema:'id'},key:'id'}
      },
      taxes: { // {tax:'IVA', value:15 } =>Table taxValue
        type: Sequelize.JSON
      },
      attachmentId: {
        type: Sequelize.INTEGER,
        allowNull:false
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('envoiceNotifies');
  }
};