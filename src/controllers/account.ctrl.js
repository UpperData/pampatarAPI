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
		return await model.Account.create({name,pass,email,peopleId,StatusId:statusId,hashConfirm,preference},{ transaction: t })
		.then(async function(rsResult){
			if(rsResult){
				//Registra Roles de la cuenta	
				const accountRole=require('./accountRoles.ctrl') //registrar rol de la cuenta	
				await model.accountRoles.create({"AccountId":rsResult.id,"RoleId":6,"StatusId":1},{ transaction: t })
				.then(async function (rsAccountRole){
					//ENVIA EMAIL DE CONFRIAMCIÓN			
					mail.sendEmail({
					"from":'"Estudio Pampatar" <upper.venezuela@gmail.com>', 
					"to":email,
					"subject": '.:CONFIRMACIÓN DE CUENTA.',
					"text":"Bienvenido",
					"html":"<H1>ENHORABUENA</H1> <HR> Este es un correo de validación <br> <a href= "+link+" >Activa Mi Cuenta </a>",
					amp: `<!doctype html>
					<html ⚡4email>
					  <head>
						<meta charset="utf-8">
						<style amp4email-boilerplate>body{visibility:hidden}</style>
						<script async src="https://cdn.ampproject.org/v0.js"></script>
						<script async custom-element="amp-anim" src="https://cdn.ampproject.org/v0/amp-anim-0.1.js"></script>
					  </head>
					  <body>
						<p>Image: <amp-img src="https://cldup.com/P0b1bUmEet.png" width="16" height="16"/></p>
						<p>GIF (requires "amp-anim" script in header):<br/>
						  <amp-anim src="https://cldup.com/D72zpdwI-i.gif" width="500" height="350"/></p>
					  </body>
					</html>`
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
			console.log(error);
			res.json({data:{"result":false,"message":"Error creando cuenta"}})
		});
    }
		catch(error){
			await t.rollback();
			console.log(error);
			
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
								const hashConfirm=getRandom(325); // Genera hash
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
	const hashConfirm=getRandom(498);
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
module.exports={add,getAll,getOne,edit,activeAccount,forgotPassword,resetPassword,updatePassword,resendConfirmEmail,getRandom}
