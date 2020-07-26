const model=require('../db/models/index');
const People=require('./people.ctrl');
const Account=require('./account.ctrl');
const accountRole=require('./accountRoles.ctrl') //registrar rol de la cuenta
var rsRoles=[{"id":"5"},{"id":"6"}];
async function add(req,res){

    return await model.sequelize.transaction(async (t) =>{
	const {documentType,firstName,lastName,documentId,birthDate,genderId,nationalityId}=req.body
	return await People.add({documentType,firstName,lastName,documentId,birthDate,genderId,nationalityId},{transaction:t})
	.then(async function (rsPeople){		
		var peopleId=rsPeople;
		const {name,pass,email}=req.body;
		return await Account.add({name,pass,email,peopleId}, {transaction: t})
		.then(async function(rsAccount){		
			var permisos=new Array();
			for (let i in rsRoles) {				
				var rol=await accountRole.add({"accountId":rsAccount,"roleId":rsRoles[i]['id'],"statusId":1}, {transaction: t});					
				permisos.push({'accountRoleId':rol}) 
			}			 			
			return permisos=JSON.stringify(permisos);				
      })
	}).then(function (result){

		res.status(200).json({"permissions":result});

	}).catch(function (err) {	
		t.rollback();	
		console.log(error)	;
		//throw new Error();
		/*return res.status(500).send({
			message: errorHandler.getErrorMessage(err)
		});*/
	});

	});
}

//async function getOne(){};

//async function edit(){};

module.exports={add}
