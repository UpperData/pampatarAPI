const mdl=require ('../db/models/index');

async function getAllPanel(req,res){
    const RoleId=req.params.role
    return await mdl.grantRole.findAll({
        where:{RoleId,StatusId:1},
        attributes : ['id'],        
        include:[{
            model:mdl.dashboardPermissions,  
            attributes:['id'], 
            where:{StatusId:1},         
            include:[{
                model:mdl.Dashboards,  
                attributes:['id'], 
                where:{StatusId:1},           
                include:[{
                    model:mdl.Module,  
                    attributes:['id','name'], 
                    where:{StatusId:1}, 
                    include:[{
                        model:mdl.subModule,  
                        attributes:['id','name'], 
                        where:{StatusId:1}, 
                    }]
                }]
                
            }]
        }]
    }).then(async function(rsPanel){
        res.json(rsPanel)
    }).catch( async function(error){
        console.log(error);
    })
}
module.exports={getAllPanel}