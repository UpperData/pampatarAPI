'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('subModules', [{
        id:1,
        ModuleId:1,
        subModuleId:1,
        path:'/processRequest',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:1,
        subModuleId:2,
        path:'/selectRequest',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:1,
        subModuleId:3,
        path:'/selectRequest',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:6,
        subModuleId:4,
        path:'/inventoryByShop',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:6,
        subModuleId:5,
        path:'/inventoryByProduct',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:6,
        subModuleId:6,
        path:'/inventoryByLocation',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:2,
        subModuleId:7,
        path:'/createContrat',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:2,
        subModuleId:8,
        path:'/viewContrat',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:4,
        subModuleId:9,
        path:'/shopSalesMonitor',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:3,
        subModuleId:10,
        path:'/upgradePolitics',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:1,
        ModuleId:5,
        subModuleId:11,
        path:'/notificaionSend',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('subModules', null, {});
    
  }
};
