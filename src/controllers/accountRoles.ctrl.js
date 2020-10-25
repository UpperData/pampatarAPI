const models=require('../db/models/index');

async function getRoleByAccount(req,res){
	const{AccountId}=req;
	return await models.accountRoles.findAll({ where:{AccountId},
		include:[{
			model:models.Account
		}],
		include:[{
			model:models.Roles
		}]
	})
	.then(async function(srResult){		
		return srResult; 		
	}).catch(function(error){
		console.log(error);
		res.status(500).json({ data:{"result":false,"message":"Algo salió mal, no se pudo buscar "}})
	})	
}
async function add(req,res){
	try{		
		const {accountId,roleId,statusId}=req;
		return await model.accountRoles.create({accountId,roleId,statusId})
		.then(function(rsResult){
			return rsResult.id;
		});
    }
    catch(error){
		//console.log(error);
		res.status(500).json({ data:{"result":false,"message":"Algo salió mal registrando cuenta"}})
    }
}


module.exports={getRoleByAccount,add};
