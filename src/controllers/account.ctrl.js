const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
const bcrypt = require('bcryptjs');
const hostAPI='http://18.230.123.31:4094/';
//const hostAPI='http://localhost:4094/';
const host='http://192.99.250.22/pampatar/#';

async  function add(req,res){
	const t = await model.sequelize.transaction();	
	    try{
		const salt=await bcrypt.genSalt(10);
		req.body.pass =await bcrypt.hash(req.body.pass,salt);
		req.body.hashConfirm=getRandom(371);
		const link=hostAPI+"account/verify/"+req.body.hashConfirm;
		const {name,pass,email,peopleId,statusId,hashConfirm,roles,preference }=req.body;
		// prefe=JSON.stringify(preference);
		return await model.Account.create({name,pass,email,peopleId,statusId,hashConfirm,preference},{ transaction: t })
		.then(async function(rsResult){
			if(rsResult){
				//Registra Roles de la cuenta	
				const accountRole=require('./accountRoles.ctrl') //registrar rol de la cuenta	
				await model.accountRoles.create({"accountId":rsResult.id,"roleId":roles,"statusId":1},{ transaction: t })
				.then(async function (rsAccountRole){
					//ENVIA EMAIL DE CONFRIAMCIÓN			
					mail.sendEmail({"from":"Estudio Pampatar",
					"to":email,
					"subject": '.:Cuenta Pampatar - Confirmación:.',
					"text":"Bienvenido",
					"html":"<a href="+link+">Activa tu cuenta </a>"
					},{ transaction: t })
					await t.commit();
					res.status(200).json(rsResult);
				}).catch(async function(error){
					await t.rollback();
					res.json({data:{"result":false,"message":"Error asignando role"}})
				});
			}			
		}).catch(async function(error){
			await t.rollback();
			res.json({data:{"result":false,"message":"Error creando cuenta"}})
		});
    }
		catch(error){
			await t.rollback();
			//res.status(500).json({ data:{"message":"Recording Account Error"}})
    }
};
/*
async function getAll(data,res){
    
	return await model.Account.findAll	({
	    atributes:['id','name','email','peopleId','statusId']
	}).then(function(rsAccount){
		return rsAccount 
	}).  
    catch(async function(error){
	    res.status(500).json({ data:{"message":'Ocurrion un error consultando todas las cuentas'}})
    })
}*/

async function getOne(req,res){

    const {id}=req.params;    
	return await model.Account.findOne({
	    where: {id,StatusId:1}
	}).then(function (rsAccount){
		return rsAccount
	}).catch(async function (error){
		res.status(500).json({data:{ "message":"Ocurrio un error consultando información de su cuenta"}});
	})
    
};

async function edit(req,res){
    const{id}=req.params;
    const {email,hashConfirm,statusId}=req.body;
    try{
	return await getOne(req,res)
 	.then(async function(rsAccount){
		if(rsAccount){
		    await rsAccount.update({email,hashConfirm,statusId});
		}
		else{res.status(404).json({"message":"Cuenta de Usuario no existe"});}

	    	return rsAccount;
	}).then(function(result){
		return result;
	});
    }
    catch(error){
	    res.status(500).json({data:{mesage: 'Someting goes wrong editting Account'}
	})
    }
}

function getRandom(long) {   
	let now= new Date();
	var crypto = require("crypto");
	return crypto.randomBytes(long).toString('hex')+now.getTime();
}
async function activeAccount(req,res){
	try{
		const {id}=req.params;
		if(id!==null){
			return await model.Account.findAndCountAll({where:{hashConfirm:id,confirmStatus:false}})
			.then(async function (rsAccount){
				if(rsAccount.count>0){
					return await model.Account.update({confirmStatus:true,hashConfirm:null},{where:{hashConfirm:id,confirmStatus:false}})
					.then(function(rsResult){
						if(rsResult){
							res.redirect(host+"/sign-in");				
						}
					})
				}
				else{
					res.redirect(process.env.HOST_FRONT+"postregister/false");
				}
			});
		}
		
    }
    catch(error){
		
		res.status(500).json({ data:{"message":"No fue posible verificar su cuenta"}})
    }
}

//Envia Email con token
async function forgotPassword(req, res,next) {
	const emailAccount=req.body.email;
	await model.Account.findOne({attributes:['id'], where:{ email:emailAccount }}) // Valida si existe
		.then(async function(rsSearch){		
			if(rsSearch==null){				
				res.json({data:{"result":false,"message":"Correo Electrónico no valido"}})				
			}else{
				await model.Account.findOne({attributes:['id'], where:{email:emailAccount,statusId:1}}) // Valida si esta activa
				.then(async function(rsStatus){
					if(!rsStatus){						
						res.json({data:{"result":false,"message":"Su cuenta esta inactiva, comuníquese con pampatar.cl"}})
					}else{
						const acc= await model.Account.findOne({attributes:['id'], where:{ email:emailAccount,confirmStatus:true}}) // Valida si esta confirmada
						.then(async function(rsConfirm){
							if(!rsConfirm){	
								const resend= await resendConfirmEmail(emailAccount);								
								if(resend['data'].result){
									res.json({data:{"result":false,"message":resend['data'].message}})
								}
							}else{
								const type="forgot"
								const hashConfirm=await servToken.newToken(Account.id,moment().unix(),emailAccount,type); //generar Token 	; // Genera hash
								//editHash({email:'angele.elcampeon@gmail.com'}); //guarda hash en DB								
								var link=process.env.HOST_BACK+"account/security/"+hashConfirm; // crea link de restauracioń								
								return await model.Account.update({hashConfirm},{where:{id:acc.id}})
								.then(async function(rsHash){
									if(!rsHash){
										res.json({data:{"result":false,"message":"Ocurrió un error, intente nuevamente"}})
									}else{
										// Enviar Email para restauración de Password	
										mail.sendEmail({"from":"Pampatar <upper.veenzuela@gmail.com>",
										"to":emailAccount,
										"subject": '.:Recuperación Contraseña :.',
										"text":" Este es un servicio automático de restauración de Contraseña de Pampatar",
										"html": "<h2>¡Recuperación de Contraseña!</h2> <br> <h4>Queremos ayudarete a recuperar tu Contraseña, Cick en el enlace para cambiar la Contraseña de tu cuenta Pampatar.</h4><br><a href="+link+">Click aquí para cambia su Contraseña</a>"
										})
										res.status(200).json({data:{"result":true,"message":"Se a enviado un Correo Electrónico de recuperación de contraseña"}})
									}
								})

							}
						})
					}
				})
			}

		}
	)	

}
//Direcciona a la Página de Cambio de Password
async function resetPassword(req,res){
	try{

		const {id}=req.params;
		try{       
			var payload= await jwt.decode(id,process.env.JWT_SECRET) // Decodifica Token
		}catch(error){
			res.status(401).json({"data":{"result":false,"message":"No fue posible validar su identidad"}}) 
		}            
		if(payload){  						
			if(payload.exp<=moment().unix()){ // Valida expiración
				res.status(401).json({"data":{"result":false,"message":"Su token a expirado, generar uno nuevo en pampatar.cl "}})                
			}else { 
				await model.Account.findOne({attributes:['id'], where:{id:payload.Account}})
				.then(function (rsAccount){
					if(!rsAccount){
						res.status(200).json({data:{"result":"False","message":"Cuenta invalida"}})
					}else{
	
						res.redirect(process.env.HOST_FRONT+"/resetPassword/"+id);				
					}
	
				})
			}
		}		
    }
    catch(error){		
		res.status(500).json({ data:{"message":"No se pudo direcciónar a destino, intente nuevamente"}})
    }
}
//Cambia password de la cuenta 
async function updatePassword(req,res){
	const salt=await bcrypt.genSalt(10);
	req.body.pass =await bcrypt.hash(req.body.pass,salt);
	const{token,pass}=req.body;
	try{       
		var payload= await jwt.decode(token,process.env.JWT_SECRET) // Decodifica Token
	}catch(error){
		res.status(401).json({"data":{"result":false,"message":"No fue posible validar su identidad"}}) 
	}            
	if(payload){  						
		if(payload.exp<=moment().unix()){ // Valida expiración
			res.status(401).json({"data":{"result":false,"message":"Su token a expirado, generar uno nuevo en pampatar.cl "}})                
		}else{ 
			await model.Account.findOne({ where:{id:payload.account }})
			.then(async function(rsHash){
				if(!rsHash){
					res.json({data:{"result":false,"message":"Enlace no valido"}});
				}else{			
					await model.Account.update({pass,hashConfirm:null},{where:{id:Account.id }})
					.then(function(rsUpdate){
						mail.sendEmail({
						"from":"Pampatar <upper.venezuela@gmail.com>",
						"to":rsHash.email,
						"subject": '.:Notificación Pampatar:.',
						"text":" Este es un servicio automático de restauración de Contraseña de Pampatar",
						"html": "<h2>¡Operación Satisfactoria!</h2> <br> <h4>Usted a Cambiado su Contraseña exitosamente.</h4>"
						})
						res.json({data:{"result":true,"message":"Contraseña cambiada con satisfactoriamente"}});
					}).catch(async function(error){
						res.json({data:{"result":true,"message":"Ocurrio un error procesando su solicitud"}});
					})
				}		
			})
		}
	}
}

async function resendConfirmEmail(email){
	const type="newAccount"	
	const hashConfirm=await servToken.newToken(statusId,moment().unix(),email,type); //generar Token 	;
	var link=process.env.HOST_BACK+"account/verify/"+hashConfirm;
	return await model.Account.findOne({where:{email,confirmStatus:false}})
	.then(async function(rsResult){
		if(rsResult){
			//Registra Roles de la cuenta	
			return await model.Account.update({hashConfirm},{where:{email,confirmStatus:false}})
			//await accountRole.add({"accountId":rsResult.id,"roleId":roles,"statusId":1})
			.then(async function (rsHash){
				//ENVIA EMAIL DE CONFRIAMCIÓN
				if(rsHash){
					mail.sendEmail({"from":"Pampatar <upper.venezuela@gmail.com>",
					"to":email,
					"subject": '.:Cuenta Pampatar - Confirmación:.',
					"text":"¡Enhorabuena!, Estas aun paso de formar parte de Pampatar",
					"html": "<h2>¡Enhorabuena!</h2> <br> <h4>Estas aun paso de formar parte de Pampatar, Haga Cick en el enlace para confirmar activar tu cuenta Pampatar.</h4><br><a href="+link+">Click aquí para verificar</a>"					
					});
					return {data:{"result":true,"message":"Hemos reenviado un correo de confirmación para que actives tu cuenta "}};
				}			
			}).catch(async function(error){
				return {data:{"result":true,"message":"Ocurrión error procesando su solicitud"}};
			})			
		}			
	});
}

module.exports={add,getOne,edit,activeAccount,forgotPassword,resetPassword,updatePassword,resendConfirmEmail,getRandom};
