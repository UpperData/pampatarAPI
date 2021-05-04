const models=require('../db/models/index');

async function getRoleByAccount(req,res){
	const{AccountId}=req;
	return await models.accountRoles.findAll({ 
		where:{AccountId,StatusId:1},
		include:[
			{
			model:models.Account
			},
			{
			model:models.Roles
			}
		]
	})
	.then(async function(srResult){		
		return srResult; 		
	}).catch(async function(error){
		console.log(error);
		return { data:{"result":false,"message":"Algo salió mal, no se pudo buscar "}};
		//res.json({ data:{"result":false,"message":"Algo salió mal, no se pudo buscar "}})
	})	
}
async function add(req,res){
	console.log(req)
	const {accountId,RoleId,statusId}=req;
	return await models.accountRoles.create({accountId,RoleId,StatusId:statusId})
	.then(function(rsResult){
		return rsResult;
	}).catch(async function (error){
		console.log(error);
		return { data:{"result":false,"message":"Algo salió mal asignando permiso"}};
	})
}
module.exports={getRoleByAccount,add};
