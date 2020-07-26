const model=require('../db/models/index');
const Account=require('./account.ctrl');
const Role= require('./role.ctrl')
async function getRoleByAccount(req,res){

    try{
	const{accountId}=req;
	var sql='select "accountRoles"."id" arId, "Accounts"."id"  accId, "Accounts"."name" accName, "Roles"."id" roleId, "Roles"."name" rolName from "accountRoles" join "Accounts" on "Accounts"."id"="accountRoles"."accountId" join "Roles" on "Roles"."id"="accountRoles"."roleId" where "Accounts"."id"='+accountId;
	return await model.sequelize.query(sql,{model:model.accountRoles,mapToModel:true}).then(async function (rsRoles){ return rsRoles;})
    }catch(error){
	console.log(error);
    }	
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
		res.status(500).json({ data:{"message":"Recording Account Error"}})
    }
}


module.exports={getRoleByAccount,add};
