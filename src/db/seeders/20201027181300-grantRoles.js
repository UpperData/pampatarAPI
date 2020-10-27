'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
       return queryInterface.bulkInsert('grantRoles', [{
       
        DashboardId:1,
        RoleId:7,       
        StatusId:1,        
        createdAt: new Date(),
        updatedAt: new Date() 
    },{      
      DashboardId:2,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:3,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{     
      DashboardId:4,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:5,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:6,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:7,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:8,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:9,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:10,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:11,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:12,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:13,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:14,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:15,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:16,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:17,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:18,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:19,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:20,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:21,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:22,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:23,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:24,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:25,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:26,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:27,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:28,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    },{      
      DashboardId:29,
      RoleId:7,       
      StatusId:1,        
      createdAt: new Date(),
      updatedAt: new Date() 
    }
  ], {});

},
  down: (queryInterface, Sequelize) => {
    
      return queryInterface.bulkDelete('grantRoles', null, {});
    
  }
};