const models=require('../db/models/index');
const Account=require('./account.ctrl');
const Role= require('./role.ctrl')
async function getRoleByAccount(req,res){
	const{AccountId}=req;
	return await models.accountRoles.findAll({ where:{AccountId},
		include:[{
			model:models.Account
		}],
		include:[{
			model:models.Roles
		}]
	}).then(async function(srResult){		
		return srResult; 		
	}).catch(function(error){
		console.log(error);
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
		console.log(error);
		res.status(500).json({ data:{"result":false,"message":"Error registrando cuenta"}})
    }
}


module.exports={getRoleByAccount,add};
