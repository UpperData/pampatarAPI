'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      
      return queryInterface.bulkInsert('Warehouses', [{
        name: 'Los Chorros',
        shopId:98,
        statusId:1,
        address:'{"dirType":{"id":1,"name":"tee"},"region":{"id":23,"name":"chuu tana"},"province":{"id":45,"name":"chuu tana"},"comuna":{"id":123,"name":"El 487"},"calle":"erer","numero":"4669","local":"5569"}',
        phone:'[{"phonetype":{"id":1,"name":"local"},"number":12326565}]',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Tarapaca',
        shopId:98,
        statusId:1,
        address:'{"dirType":{"id":1,"name":"tee"},"region":{"id":23,"name":"chuu tana"},"province":{"id":45,"name":"chuu tana"},"comuna":{"id":123,"name":"El 487"},"calle":"erer","numero":"4669","local":"5569"}',
        phone:'[{"phonetype":{"id":1,"name":"local"},"number":12326565}]',
        createdAt: new Date(),
        updatedAt: new Date() 
      },{
        name: 'Machupichu',
        shopId:98,
        statusId:1,
        address:'{"dirType":{"id":1,"name":"tee"},"region":{"id":23,"name":"chuu tana"},"province":{"id":45,"name":"chuu tana"},"comuna":{"id":123,"name":"El 487"},"calle":"erer","numero":"4669","local":"5569"}',
        phone:'[{"phonetype":{"id":1,"name":"local"},"number":12326565}]',
        createdAt: new Date(),
        updatedAt: new Date() 
      }], {});   
  },
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Warehouses', null, {});

  }
};