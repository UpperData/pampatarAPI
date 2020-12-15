//const mdl=require ('../db/models/index');
const mdll= require('../db/models/index');
async  function getAllPanel(req,res){
    const {role} =req.params

	return await mdll.grantRoles.findAll({
	attributes: {exclude: ['createdAt','updatedAt']},
	where:{RoleId:role},
	include: [{
		model:mdll.Roles,
		attributes: {exclude: ['createdAt','updatedAt']},
		required:true
	},
	{
		model:mdll.Dashboards,
		attributes: {exclude: ['createdAt','updatedAt']},
		where:{StatusId:1},
		required:true,
			include:[{
				model:mdll.Permission,
				attributes: {exclude: ['createdAt','updatedAt']},
				required:true
			}],
			include:[{
				model:mdll.subModule,
				attributes: {exclude: ['createdAt','updatedAt']},				
				required:true,

				include:[{
					model:mdll.Module,
					attributes: {exclude: ['createdAt','updatedAt']},
					required:true
				}]
			}]
	}]
	})
	.then(async function (rsMenu){		
	console.log(rsMenu);
		//let hash = {};
		//rsMenu = rsMenu.filter(o => hash[o['dashboard']['subModule'].id] ? false : hash[o['dashboard']['subModule'].id] = true);
		//rsMenu = rsMenu.filter(p => hash[p['dashboard']['subModule']['module'].id] ? false : hash[p['dashboard']['subModule']['module'].id] = true);
		//res.json(rsMenu)

	// *** OPTIENE TODOS SUBMODULOS SIN DUPLICADOS
		var seenNames = {};
		var rsMenuS = rsMenu.filter(function(currentObject) {            
		    if (currentObject['Dashboard']['subModule'].id in seenNames) {
		        return false;
		    } else {
		        seenNames[currentObject['Dashboard']['subModule'].id] = true;
		        return true;
		    }
		});	

	
	// *** OPTIENE TODOS Modulo DE CADA MODULO

		var seenNames = {};
		var rsMenuM = rsMenuS.filter(function(currentObject) {
		    if (currentObject['Dashboard']['subModule']['Module'].id in seenNames) {
		        return false;
		    } else {
		        seenNames[currentObject['Dashboard']['subModule']['Module'].id] = true;
		        return true;
		    }
		});

		var rsMenuT=[];
		var sr  = [];
		for (i=0; i<rsMenuM.length; i++) {		
			
			for (j=0; j<rsMenuS.length; j++) {				
				if(rsMenuM[i]['Dashboard']['subModule']['Module'].id==rsMenuS[j]['Dashboard']['subModule'].ModuleId){			
                    sr.push({"id":rsMenuS[j]['Dashboard']['subModule'].id,"name":rsMenuS[j]['Dashboard']['subModule'].name,"desc":rsMenuS[j]['Dashboard']['subModule'].description,"route":rsMenuS[j]['Dashboard']['subModule'].route,"icon":rsMenuS[j]['Dashboard']['subModule'].icon});                    
				}
			}
            rsMenuT.push({"module":rsMenuM[i]['Dashboard']['subModule']['Module'].name,
                            "icon":rsMenuM[i]['Dashboard']['subModule']['Module'].icon,
                            "sModule":sr})
			sr= [];
		}	
		res.send(rsMenuT)
		
	}).catch(function (error) {
        //console.log(error);
		res.json({data:{"status":false,"message":"Algo salió mal generando menú"}});	
	})
}
module.exports={getAllPanel}