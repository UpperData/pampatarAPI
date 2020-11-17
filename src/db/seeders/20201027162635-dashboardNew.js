'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('Dashboards', [{
        id:1,
        subModuleId:1,
        PermissionId:2,       
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 
    },{
      id:2,
      subModuleId:1,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:3,
      subModuleId:2,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:4,
      subModuleId:2,
      PermissionId:4,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:5,
      subModuleId:2,
      PermissionId:5,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:6,
      subModuleId:3,
      PermissionId:2,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:7,
      subModuleId:3,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:8,
      subModuleId:4,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:9,
      subModuleId:4,
      PermissionId:4,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:10,
      subModuleId:4,
      PermissionId:5,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:11,
      subModuleId:5,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:12,
      subModuleId:5,
      PermissionId:4,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:13,
      subModuleId:5,
      PermissionId:5,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:14,
      subModuleId:6,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:15,
      subModuleId:6,
      PermissionId:4,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:16,
      subModuleId:6,
      PermissionId:5,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:17,
      subModuleId:7,
      PermissionId:1,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:18,
      subModuleId:7,
      PermissionId:2,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:19,
      subModuleId:7,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:20,
      subModuleId:8,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:21,
      subModuleId:8,
      PermissionId:4,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:22,
      subModuleId:8,
      PermissionId:5,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:23,
      subModuleId:9,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:24,
      subModuleId:9,
      PermissionId:4,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:25,
      subModuleId:9,
      PermissionId:5,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:26,
      subModuleId:10,
      PermissionId:2,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:27,
      subModuleId:10,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:28,
      subModuleId:12,
      PermissionId:1,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{
      id:29,
      subModuleId:12,
      PermissionId:3,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    }
  ], {});

},
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('Dashboards', null, {});
    
  }
};