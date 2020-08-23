const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
const bcrypt = require('bcryptjs');
const servToken=require('./serviceToken.ctrl');
var moment=require('moment');
const hostAPI='http://18.230.123.31:4094/';
//const hostAPI='http://localhost:4094/';
const host='http://192.99.250.22/pampatar/#';

async  function add(req,res){
	const t = await model.sequelize.transaction();	
	    try{
		const salt=await bcrypt.genSalt(10);
		req.body.pass =await bcrypt.hash(req.body.pass,salt);
		const link=hostAPI+"account/verify/"+req.body.hashConfirm;
		
		const {name,pass,email,peopleId,hashConfirm,roles,preference }=req.body;
		const type="newAccount"	  
		req.body.hashConfirm=await servToken.newToken(statusId,moment().unix(),email,type) //generar Token 	;		
		return await model.Account.create({name,pass,email,peopleId,StatusId:2,hashConfirm,preference},{ transaction: t })
		.then(async function(rsResult){
			if(rsResult){
				//Registra Roles de la cuenta	
				const accountRole=require('./accountRoles.ctrl') //registrar rol de la cuenta	
				await model.accountRoles.create({"AccountId":rsResult.id,"RoleId":6,"StatusId":1},{ transaction: t })
				.then(async function (rsAccountRole){
					//ENVIA EMAIL DE CONFRIAMCIÓN			
					mail.sendEmail({
					"from":'Pampatar <upper.venezuela@gmail.com>', 
					"to":email,
					"subject": '.:CONFIRMACIÓN DE CUENTA.',
					"text":"Bienvenido",
					"html":`<!doctype html>
					<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
					<hr style="width: 420; height: 1; background-color:#99999A;">
					<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
				
					<div  align="center">
						<h2 style="font-family:sans-serif; color:#ff4338;">¡ENHORABUENA!</h2>
						<p style="font-family:sans-serif; font-size: 19px;" > Te haz registrado con exito, Verifica tu correo para comenzar en Pampatar!</p>						
						<a href="`+ link +`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Confirmar cuenta"></a>
						<p style="font-family:sans-serif; color: #99999A; margin-top: 25px" class="card-text">¿ESTE NO ERES TÚ? COMUNICATE CON NOSOTROS</p>
					</div>						
						<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
						<br>
						<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
							<p align="center">	
								<a href="#">Quiénes somos</a> | <a href="#">Políticas de privacidad</a> | <a href="#">Términos y condiciones</a> | <a href="#">Preguntas frecuentes</a> 
							</p>					
					
							<p  align="center" >
							info@estudiopampatar.cl
									Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
							</p>
						</div>`	
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
			if(error.name=='SequelizeUniqueConstraintError'){
				res.json({data:{"result":false,"message":"El Correo Electrino ingresado ya pertenece a un usuario registrado"}})
			}else{
				res.json({data:{"result":false,"message":"Ocurrió un error en el proceso de registro creando cuenta, intente nuevamente"}})
			}
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
					try{       
						var payload= await jwt.decode(id,process.env.JWT_SECRET) // Decodifica Token
					}catch(error){
						res.status(401).json({"data":{"result":false,"message":"No fue posible validar su identidad"}}) 
					}            
					if(payload){  						
						if(payload.exp<=moment().unix()){ // Valida expiración
							res.status(401).json({"data":{"result":false,"message":"Su token a expirado, generar uno nuevo en pampatar.cl "}})        
						}else if(payload.type=="newAccount"){ // valida tipo token
							res.status(401).json({"data":{"result":false,"message":"Token no valido, generar uno nuevo en pampatar.cl "}})        
						}else{ // actualiz regsitro
							return await model.Account.update({confirmStatus:true,hashConfirm:null,StatusId:1},{where:{hashConfirm:id,confirmStatus:false}})
							.then(function(rsResult){
								if(rsResult){
									res.redirect(host+"/sign-in");				
								}
							})
						}
					}	
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
