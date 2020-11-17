'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Dashboards', [{
        id:1,
        PermissionId:1,
        subModuleId:1,
        path:'/processRequest',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:2,
        ModuleId:1,
        subModuleId:2,
        path:'/selectRequest',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:3,
        ModuleId:1,
        subModuleId:3,
        path:'/aproveRequest',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:4,
        ModuleId:6,
        subModuleId:4,
        path:'/inventoryByShop',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:5,
        ModuleId:6,
        subModuleId:5,
        path:'/inventoryByProduct',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:6,
        ModuleId:6,
        subModuleId:6,
        path:'/inventoryByLocation',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:7,
        ModuleId:2,
        subModuleId:7,
        path:'/createContrat',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:8,
        ModuleId:2,
        subModuleId:8,
        path:'/viewContrat',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:9,
        ModuleId:4,
        subModuleId:9,
        path:'/shopSalesMonitor',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:10,
        ModuleId:3,
        subModuleId:10,
        path:'/upgradePolitics',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      },{
        id:12,
        ModuleId:5,
        subModuleId:12,
        path:'/notificaionSend',
        icontype:'',
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 

      }], {});
    
  },

  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Dashboards', null, {});
    
  }
};
