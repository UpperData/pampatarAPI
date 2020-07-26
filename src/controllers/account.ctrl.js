const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
const bcrypt = require('bcryptjs');
const hostAPI='http://18.230.123.31:4094/';
const host='http://192.99.250.22/pampatar/#';

async  function add(req,res){
	    try{
		const salt=await bcrypt.genSalt(10);
		req.body.pass =await bcrypt.hash(req.body.pass,salt);
		req.body.hashConfirm=getRandom(35);
		var link=hostAPI+"account/verify/"+req.body.hashConfirm;
		const {name,pass,email,peopleId,statusId,hashConfirm,roles,preference }=req.body;
		var prefe=JSON.stringify(preference);
		return await model.Account.create({name,pass,email,peopleId,statusId,hashConfirm,preference:prefe})
		.then(async function(rsResult){
			if(rsResult){
				//Registra Roles de la cuenta	
				const accountRole=require('./accountRoles.ctrl') //registrar rol de la cuenta	
				await accountRole.add({"accountId":rsResult.id,"roleId":roles,"statusId":1})
				.then(async function (rsAccountRole){
					//ENVIA EMAIL DE CONFRIAMCIÓN			
					mail.sendEmail({"from":"Estudio Pampatar",
					"to":email,
					"subject": '.:Cuenta Pampatar - Confirmación:.',
					"text":"¡Enhorabuena!, Estas aun paso de formar parte de Pampatar",
					"html": "<h2>¡Enhorabuena!</h2> <br> <h4>Estas aun paso de formar parte de Pampatar, Haga Cick en el enlace para confirmar activar tu cuenta Pampatar.</h4><br><a href="+link+">Click aquí para verificar</a>"
					})
					res.status(200).json(rsResult);
				})			
			}			
		});
    }
		catch(error){
		
			//res.status(500).json({ data:{"message":"Recording Account Error"}})
    }
};

async function getAll(data,res){

    try{
	return await model.Account.findAll	({
	    atributes:['id','name','email','peopleId','statusId']
	}).then(function(rsAccount){return rsAccount });
    }
    catch(error){
	    res.status(500).json({ data:{"message":'something goes wrong searching All Accounts'}})
    }
}

async function getOne(req,res){

    const {id}=req.params;
    try{
	return await model.Account.findOne({
	    where: {id}
	}).then(function (rsAccount){return rsAccount})
    }
    catch (error){
  	    res.status(500).json({data:{ "message":"something goes wrong"}});
    }
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
					res.redirect(host+"postregister/false");
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
						res.json({data:{"result":false,"message":"Su cuenta esta inactiva"}})
					}else{
						await model.Account.findOne({attributes:['id'], where:{ email:emailAccount,confirmStatus:true}}) // Valida si esta confirmada
						.then(async function(rsConfirm){
							if(!rsConfirm){	
								const resend= await resendConfirmEmail(emailAccount);								
								if(resend['data'].result){
									res.json({data:{"result":false,"message":resend['data'].message}})
								}
							}else{
								const hashConfirm=getRandom(40); // Genera hash
								//editHash({email:'angele.elcampeon@gmail.com'}); //guarda hash en DB								
								var link=hostAPI+"account/security/"+hashConfirm; // crea link de restauracioń								
								return await model.Account.update({hashConfirm},{where:{statusId:1,confirmStatus:true,email:emailAccount}})
								.then(async function(rsHash){
									if(!rsHash){
										res.json({data:{"result":false,"message":"Parece que ocurrió un error, intente nuevamente"}})
									}else{
										// Enviar Email para restauración de Password	
										mail.sendEmail({"from":"Estudio Pampatar",
										"to":emailAccount,
										"subject": '.:Pampatar - Recuperar Contraseña :.',
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
		if(id!==null){
			await model.Account.findOne({attributes:['id'], where:{hashConfirm:id,statusId:1,confirmStatus:true}})
			.then(function (rsAccount){
				if(!rsAccount){
					res.status(200).json({data:{"result":"False","message":"Cuenta invalida"}})
				}else{

					res.redirect(host+"/resetPassword/"+id);
					/*res.render('/resetPassword', {
						token: id
					   });*/
					//var html="<h2>Test Render</h2>"
					/*res.render('reset', function (err, html) {
						res.send(html)
					  })*/
				}

			})
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
	await model.Account.findOne({ where:{hashConfirm: token }})
	.then(async function(rsHash){
		if(!rsHash){
			res.json({data:{"result":false,"message":"Enlace no valido"}});
		}else{			
			await model.Account.update({pass,hashConfirm:null},{where:{hashConfirm: token }})
			.then(function(rsUpdate){
				mail.sendEmail({"from":"Estudio Pampatar",
				"to":rsHash.email,
				"subject": '.:Notificación Pampatar:.',
				"text":" Este es un servicio automático de restauración de Contraseña de Pampatar",
				"html": "<h2>¡Operación Satisfactoria!</h2> <br> <h4>Usted a Cambiado su Contraseña exitosamente.</h4>"
				})
				res.json({data:{"result":true,"message":"Contraseña cambiada con satisfactoriamente"}});
			})
		}		
	})
}

async function resendConfirmEmail(email){
	const hashConfirm=getRandom(45);
	var link=hostAPI+"account/verify/"+hashConfirm;
	return await model.Account.findOne({where:{email,confirmStatus:false}})
	.then(async function(rsResult){
		if(rsResult){
			//Registra Roles de la cuenta	
			return await model.Account.update({hashConfirm},{where:{email,confirmStatus:false}})
			//await accountRole.add({"accountId":rsResult.id,"roleId":roles,"statusId":1})
			.then(async function (rsHash){
				//ENVIA EMAIL DE CONFRIAMCIÓN
				if(rsHash){
					mail.sendEmail({"from":"Estudio Pampatar",
					"to":email,
					"subject": '.:Cuenta Pampatar - Confirmación:.',
					"text":"¡Enhorabuena!, Estas aun paso de formar parte de Pampatar",
					"html": "<h2>¡Enhorabuena!</h2> <br> <h4>Estas aun paso de formar parte de Pampatar, Haga Cick en el enlace para confirmar activar tu cuenta Pampatar.</h4><br><a href="+link+">Click aquí para verificar</a>"					
					});
					return {data:{"result":true,"message":"Hemos reenviado un correo de confirmación para que actives tu cuenta, "}};
				}			
			})			
		}			
	});
}
module.exports={add,getAll,getOne,edit,activeAccount,forgotPassword,resetPassword,updatePassword,resendConfirmEmail}
