const model = require('../db/models/index');
const mail = require ('./mail.ctrl');
const bcrypt = require('bcryptjs');
const servToken = require('./serviceToken.ctrl');
const generals = require('./generals.ctrl');
const accountRole = require('./accountRoles.ctrl') //registrar rol de la cuenta	
//const {getRoleByAccount}=require('./accountRoles.ctrl');
var jwt = require('jwt-simple');
require ('dotenv').config();
var moment = require('moment');

async  function add(req,res){
	const t = await model.sequelize.transaction();	
	    try{
		const salt=await bcrypt.genSalt(10);
		req.body.pass =await bcrypt.hash(req.body.pass,salt);
		const {name,pass,email,peopleId,roles,preference }=req.body;
		const type="newAccount"	  //tipo de TOken
		hashConfirm=await servToken.newToken(name,moment().unix(),email,{"people":null},type) //generar Token 	;		
		const link=process.env.HOST_BACK+"account/verify/"+hashConfirm;
		//console.log(req.body.hashConfirm);
		return await model.Account.create({name,pass,email,peopleId,StatusId:2,hashConfirm,preference},{ transaction: t })
		.then(async function(rsResult){
			if(rsResult){
				//Registra Roles de la cuenta	
				
				await model.accountRoles.create({"AccountId":rsResult.id,"RoleId":6,"StatusId":1},{ transaction: t }) // Consede rol de Comprador
				.then(async function (rsAccountRole){
					//ENVIA EMAIL DE CONFRIAMCIÓN			
					var malsend= await  mail.sendEmail({
					"from":'Pampatar <upper.venezuela@gmail.com>', 
					"to":email,
					"subject": '.:CONFIRMACIÓN DE CUENTA.',
					"text":"Bienvenido",
					"html":`<!doctype html>
					<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
					<hr style="width: 420; height: 1; background-color:#99999A;">
					<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
				
					<div  align="center">
						<h2 style="font-family:sans-serif; color:#ff4338;">¡ENHORABUENA!</h2>
						<p style="font-family:sans-serif; font-size: 19px;" > Te haz registrado con exito, Verifica tu correo para comenzar en Pampatar!</p>						
						<a href="`+ link +`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Confirmar cuenta"></a>
						<p style="font-family:sans-serif; color: #99999A; margin-top: 25px" class="card-text">¿ESTE NO ERES TÚ? COMUNICATE CON NOSOTROS</p>
					</div>	
						<br>					
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
					if(malsend){
						await t.commit();
						res.status(200).json({"data":{"result":true,"message":"Su cuenta se ha resgistrado satisfactoriamente"}});						
					}else{
						await t.rollback();
						res.status(200).json({"data":{"result":false,"message":"No fue posible registrar su cuenta, intente nuevaente"}});						
					}					
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

		const {id}=req.params;
		if(id!==null){
			const t = await model.sequelize.transaction();  
			return await model.Account.findAndCountAll({where:{hashConfirm:id,confirmStatus:false}},{transaction:t})
			.then(async function (rsAccount){				
				if(rsAccount.count>0){
					//console.log(rsAccount);
					//console.log(rsAccount['rows'][0].id);
					try{       
						var payload= await jwt.decode(id,process.env.JWT_SECRET) // Decodifica Token
						//console.log(payload.type)
					}catch(error){
						//console.log(error)
						await t.rollback()
						res.status(401).json({"data":{"result":false,"message":"No fue posible validar su identidad"}}) 
					}            
					if(payload){  						
						if(payload.exp<=moment().unix()){ // Valida expiración
							res.status(401).json({"data":{"result":false,"message":"Su token a expirado, generar uno nuevo en pampatar.cl "}})        
						}else if(payload.type!='newAccount'){ // valida tipo token
							res.status(401).json({"data":{"result":false,"message":"Token no valido, generar uno nuevo en pampatar.cl "}})        
						}else{ // actualiza registro
							return await model.Account.update({confirmStatus:true,hashConfirm:null,StatusId:1},{where:{id:rsAccount['rows'][0].id}},{transaction:t})
							.then(async function(rsResult){
								if(rsResult){
									await t.commit()
									res.redirect(process.env.HOST_FRONT+"sign-in?success=true");													
								}
							}).catch(async function(error){
								await t.rollback()
								//console.log(error)
								res.json({"data":{"result":false,"message":"No fue posible confirmar su cuenta, intente nuevamente"}})
							})
						}
					}	
				}
				else{
					res.redirect(process.env.HOST_FRONT+"postregister/false"); 
				}
			});
		}
		
   
}

//Envia Email con token
async function forgotPassword(req, res,next) {
	const t = await model.sequelize.transaction();  
	const emailAccount=req.body.email;
	await model.Account.findOne({attributes:['id'], where:{ email:emailAccount }},{transaction:t}) // Valida si existe
		.then(async function(rsSearch){		
			if(rsSearch==null){				
				await t.rollback();
				res.json({data:{"result":false,"message":"Correo Electrónico no valido"}})				
			}else{
				await model.Account.findOne({attributes:['id'], where:{email:emailAccount,statusId:1}},{transaction:t}) // Valida si esta activa
				.then(async function(rsStatus){
					if(!rsStatus){	
						await t.rollback();					
						res.json({data:{"result":false,"message":"Su cuenta esta inactiva, comuníquese con pampatar.cl"}})
					}else{
						const acc= await model.Account.findOne({attributes:['id'], where:{ email:emailAccount,confirmStatus:true}},{transaction:t}) // Valida si esta confirmada
						.then(async function(rsConfirm){
							if(!rsConfirm){	
								const resend= await resendConfirmEmail(emailAccount)	;								
								if(resend['data'].result){
									await t.commit();	
									res.json({data:{"result":false,"message":resend['data'].message}})
									
								}
							}else{
								const type="forgot" //tipo de token
								const hashConfirm=await servToken.newToken(rsSearch.id,moment().unix(),emailAccount,{"people":null},type); //generar Token 	; // Genera hash
								//editHash({email:'angele.elcampeon@gmail.com'}); //guarda hash en DB								
								var link=process.env.HOST_BACK+"account/security/"+hashConfirm; // crea link de restauracioń								
								return await model.Account.update({hashConfirm},{where:{id:rsSearch.id}},{transaction:t})
								.then(async function(rsHash){
									if(!rsHash){
										await t.rollback();	
										res.json({data:{"result":false,"message":"Algo salió mal, intente nuevamente"}})
									}else{
										console.log(emailAccount);
										// Enviar Email para restauración de Password	
										var meailSend=await mail.sendEmail({
										"from":"Pampatar <upper.venezuela@gmail.com>",
										"to":emailAccount,
										"subject": '.:Recuperación Contraseña :.',
										"text":" Este es un servicio automático de restauración de Contraseña de Pampatar",										
										"html": `<!doctype html>
										<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
										<hr style="width: 420; height: 1; background-color:#99999A;">
										<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
									
										<div  align="center">
											<h2 style="font-family:sans-serif; color:#ff4338;" >¡Recuperación de Contraseña!</h2>
											<p style="font-family:sans-serif; font-size: 19px;" >Haz click en el botton para cambiar la Contraseña de tu cuenta Pampatar</p>
											<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Cambiar Contraseña"></a>
											<br>
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
										})
										if(meailSend){
											await t.commit();	
											res.status(200).json({data:{"result":true,"message":"Se envió un Correo Electrónico de recuperación de contraseña"}})
										}else{
											await t.rollback();	
											res.status(403).json({data:{"result":false,"message":"Algo salió mal procesando su solicitud"}})
										}										
									}
								}).catch(async function(error){
									await t.rollback();	
									console.log(error)
									res.status(403).json({data:{"result":false,"message":"Algo salió mal gestionando cambio de contraseña"}})
								})
							}
						}).catch(async function(error){
							await t.rollback();	
							console.log(error)
							res.status(403).json({data:{"result":false,"message":"Algo salió mal validando el estatus de su cuenta"}})
						})
					}
				}).catch(async function(error){
					await t.rollback();	
					console.log(error)
					res.status(403).json({data:{"result":false,"message":"Algo salió mal intentando verificar su cuenta"}})

				})
			}
		}).catch(async function(error){
			await t.rollback();	
			console.log(error)
			res.status(403).json({data:{"result":false,"message":"Algo salió mal identificando su Correo Electrónico"}})
		})	
}
//Direcciona a la Página de Cambio de Password
async function resetPassword(req,res){
	const token=req.params.id;
	//console.log(token)
	try{       
		var payload= await jwt.decode(token,process.env.JWT_SECRET) // Decodifica Token
	}catch(error){
		
		//res.status(401).json({"data":{"result":false,"message":"No fue posible validar su identidad"}}) 
		res.redirect(process.env.HOST_FRONT+"idetificationError?message="+"No fue posible validar su identidad");
	}            
	if(payload){  						
		//console.log(payload);
		if(payload.exp<=moment().unix()){ // Valida expiración
			//res.status(401).json({"data":{"result":false,"message":"Su token a expirado, generar uno nuevo en pampatar.cl "}})                
			res.redirect(process.env.HOST_FRONT+"idetificationError?message="+"Su token a expirado, generar uno nuevo en pampatar.cl");
		}else { 
			await model.Account.findOne({where:{id:payload.account,statusId:1}})
			.then(async function (rsAccount){
				if(!rsAccount){
					res.status(200).json({data:{"result":false,"message":"La cuenta que intenta recuperar no es valiada"}})
				}else{	
					await model.Account.update({hashConfirm:null}, {where:{id:payload.account,statusId:1}})
					res.redirect(process.env.HOST_FRONT+"resetPassword?token="+token);				
				}	
			}).catch(async function(error){
				console.log(error);
				///res.status(401).json({"data":{"result":false,"message":"Su token a expirado, generar uno nuevo en pampatar.cl "}})                
				res.redirect(process.env.HOST_FRONT+"idetificationError?message="+"Su token a expirado, generar uno nuevo en pampatar.cl");
			})
		}
	}else{
		res.redirect(process.env.HOST_FRONT+"idetificationError?message="+"No fue posible validar su identidad");
	}		  
}
//Cambia password de la cuenta 
async function updatePassword(req,res){
	const t = await model.sequelize.transaction();

	const salt=await bcrypt.genSalt(10);
	req.body.pass =await bcrypt.hash(req.body.pass,salt);
	const{token,pass}=req.body;
	
	try{       

		var payload= await jwt.decode(token,process.env.JWT_SECRET) // Decodifica Token
		const account=generals.currentAccount(token)      
	}catch(error){
		res.status(401).json({"data":{"result":false,"message":"No fue posible validar su identidad"}}) 
	} 
	  
	if(payload){  						
		console.log(payload);
		if(payload.exp<=moment().unix()){ // Valida expiración
			await t.rollback()
			res.status(401).json({"data":{"result":false,"message":"Su token a expirado, debe generar uno nuevo en pampatar.cl "}})                
		}else{ 
			await model.Account.findOne({attributes:['id']}, {where:{id:payload.account }},{transaction:t})
			.then(async function(rsHash){
				if(!rsHash){
					await t.rollback();
					console.log(error);
					res.json({data:{"result":false,"message":"No fue posible validar su cuenta, debe realizar nuevamete el proceso de restauración"}});
				}else{			
					await model.Account.update({pass,hashConfirm:null},{where:{id:payload.account }},{transaction:t})
					.then(async function(rsUpdate){
						var mailSend = await mail.sendEmail({
						"from":"Pampatar <upper.venezuela@gmail.com>",
						"to":payload.people,
						"subject": '.:Notificación Pampatar:.',
						"text":" Este es un servicio automático de restauración de Contraseña de Pampatar",
						"html": `<!doctype html>
						<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
						<hr style="width: 420; height: 1; background-color:#99999A;">
						<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
					
						<div  align="center">
							<h2 style="font-family:sans-serif; color:#ff4338;" >¡Su contraseña a sido restaurada satisfactoriamente!</h2>
							<br>
							<p style="font-family:sans-serif; font-size: 19px;" >Si desconoce esta operación comuniquece con Pampatar.cl</p>
							
							<br>
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
						})
						if(mailSend){
							await t.commit();
							res.json({data:{"result":true,"message":"Contraseña cambiada con satisfactoriamente"}});
						}else{
							await t.rollback();
							console.log(error);
							res.json({data:{"result":false,"message":"Algo salió mal enviando notificaión, Intente nuevamente"}});
						}
						
					}).catch(async function(error){
						await t.rollback();
						console.log(error);						
						res.json({data:{"result":false,"message":"Algo salió mal procesando su solicitud"}});
					})
				}		
			}).catch(async function(error){
				await t.rollback();
				console.log(error);
				res.json({data:{"result":false,"message":"Algo salió mal identificando remitente"}});
			})
		}
	}
}

async function resendConfirmEmail(email){
	const type="newAccount"	
	const hashConfirm=await servToken.newToken(statusId,moment().unix(),email,{"people":null},type); //generar Token 	;
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
async function changePassword(req,res){ // Cambio de contraseña para usuario logueado
	const{passwordOld,passwordNew} =req.body
/*	const salt=await bcrypt.genSalt(10);
	passNew =await bcrypt.hash(passwordNew,salt);
	return await model.Account.update({pass:passNew},{where:{id:188,statusId:1}})*/

	const account=await generals.currentAccount(req.header('Authorization').replace('Bearer ', ''));
	try{
		if(passwordOld.length>5 && passwordNew.length>5 ){
			const t = await model.sequelize.transaction();
			return await model.Account.findAndCountAll({where:{id:account['data']['account'].id},transaction:t})
			.then(async function (rsAccount){
				console.log(rsAccount['rows'][0].pass);
				if(rsAccount.count>0){
					return await  bcrypt.compare(passwordOld,rsAccount['rows'][0].pass)
					.then(async function (rsPassOld){
						if(rsPassOld){
							const salt=await bcrypt.genSalt(10);
							passNew =await bcrypt.hash(passwordNew,salt);
							return await model.Account.update({pass:passNew},{where:{id:account['data']['account'].id,statusId:1},transaction:t})
							.then(async function(rsResult){
								if(rsResult){
									await t.commit()
									res.json({"data":{"result":true,"message":"Su contraseña a sido cambia satisfactoriamente"}})
								//	res.redirect(process.env.HOST_FRONT+"/sign-in");				
								}else{
									await t.rollback()
									res.json({"data":{"result":false,"message":"Su cuenta de usuario esta inactiva, intente nuevamente"}})
									//res.redirect(process.env.HOST_FRONT+"/error");				
								}
							}).catch(async function(error){
								await t.rollback()
								res.json({"data":{"result":false,"message":"No se puedo cambiar su contraseña, intenten nuevamente"}})
							})
						}else{
							await t.rollback()
							res.json({"data":{"result":false,"message":"La contraseña actual que ingerso es invalida"}})
						}
					}).catch(async function(error){					
						await t.rollback()
						res.json({"data":{"result":false,"message":"No fue posible certificar su contraseña actual, intente nuevamente"}})	
					})
				}
				else{
					res.json({"data":{"result":false,"message":"Su cuenta de usuario a sido desactivada recientemente"}})	
				}
			}).catch(async function(error){
			
				await t.rollback();
				res.json({"data":{"result":false,"message":"No fue posible identificar su cuenta de usuario, intente nuevamente"}})				
			})
		}else{
			res.json({"data":{"result":false,"message":"Debe suministrar la contraseña actual y la nueva Contraseña mayores de 5 Caracteres"}})				
		}
	}catch(error){
		res.json({"data":{"result":false,"message":"No fue posible cambiar su contraseña, intente nuevamente"}})				
	}
	
}

async function loginToken(req,res){	
	const {token}= req.params	
	//const token= req.header('Authorization').replace('Bearer ', '');
	if(!token){
		res.json({"data":{"result":false,"messaje":"Sesión expirada"}});
		//windows.location.href = process.env.HOST_FRONT+'expired/error'
		//res.redirect(process.env.HOST_FRONT+'expired/error');
	}else{

		try{
			
			await generals.currentAccount(token)		
			.then(async function(rsCurrentAccount){	
				console.log(rsCurrentAccount);
				if(!rsCurrentAccount){
					res.json({"data":{"result":false,"messaje":"Sesión expirada"}});				
					//res.redirect(process.env.HOST_FRONT+'expired/error');
				}else{
					await generals.getShopId(token)
					.then(async function(getShop){							
						if(getShop){
							res.json({"data":{"result":true,"message":"Usted a iniciado sesión como "+rsCurrentAccount['data'].account.email,
								"account":{ "id": rsCurrentAccount['data'].account.id,"name":rsCurrentAccount['data'].account.name,"email":rsCurrentAccount['data'].account.email},
								"role":rsCurrentAccount['data'].role,
								"shop":{"id":getShop.id,"postulacionId":getShop.shopRequestId,"name":getShop.name}}}	)			
						}else{
							res.json({"data":{"result":true,"message":"Usted a iniciado sesión como "+rsCurrentAccount['data'].account.email,
								"account":{ "id": rsCurrentAccount['data'].account.id,"name":rsCurrentAccount['data'].account.name,"email":rsCurrentAccount['data'].account.email},
								"role":{"id":rsCurrentAccount['data'].role.id,"name":rsCurrentAccount['data'].role.name}}})			
						}				
					}).catch(async function(error){
						console.log(error);
						res.json({"data":{"result":false,"message":"Algo no salio bien, no se pudo buscar las tiendas"}})
					})	
				}
						
			}).catch(async function(error){
				console.log(error);
				res.json({"data":{"result":false,"message":"Su token no es valido"}})
			})	
		}
		catch(error){
			console.log(error);
			//res.redirect('https://bk.pampatar.cl')
			res.json({"data":{"result":false,"message":"No se pudo valida su identidad"}})
		}
	}
	
}

async function loginBackoffice(req,res){
	
	const{name,email,pass}=req.body;
	return await model.Account.findAndCountAll({
		attributes:['id','name','email','peopleId','pass'],
		where: {email:email,statusId:1,confirmStatus:true},
	include: [{
		model:model.People,
		attributes: {exclude: ['createdAt','updatedAt']}
	}
	]}).then(async function (rsUser){
			
		if(rsUser.count>0){	
			return await  bcrypt.compare(pass,rsUser['rows'][0].pass)
			.then(async  function (rsPass){
				if(rsPass){
					if (rsUser['rows']['0'].peopleId!=null) {		
						people= await model.People.findOne({attributes:['id','firstName','lastName'],where:{id:rsUser['rows']['0'].peopleId}});						
					}else {
						people={'id':null,'firstName':null,'lastName':null}
					}						
					return await accountRole.getRoleByAccount({AccountId:rsUser['rows'][0].id})  
					.then(async function (rsAccRoles){
						if(rsAccRoles.length>0 && await generals.thisRole([{"accountId":rsUser['rows'][0].id},{"roleId":[{"id":5},{"id":7}]}]) ){
							var tokenRole
							var allRole  = [];
							for (let i=0; i<rsAccRoles.length; i++){
								allRole.push({"id":rsAccRoles[i]['Role'].id,"name":rsAccRoles[i]['Role'].name});
							}
							dataPeople= {"id":people.id,"name":people.firstName,"last":people.lastName}	
							dataAccount={"id":rsUser['rows'][0].id,"name":rsUser['rows'][0].name,"email":rsUser['rows'][0].email}
							dataShop=await generals.shopByAccount({accountId:dataAccount.id});
							today=new Date();
							var token =  await servToken.newToken(dataAccount,allRole,dataShop['data']['shop'],dataPeople,'login',today) //generar Token 									
							res.status(200).json({data:{"result":true,"message":"Usted a iniciado sesión " + rsUser['rows'][0].email ,"token":token,tokenRole,"account":dataAccount,"role":allRole,"shop":dataShop['data']['shops'],"dateTime":today}});							
						}
						else{				
							res.status(200).json({data:{"result":false,"message":"Usted no esta autorizado para ingresar a esta sección"}});
						}
					})	
				}else {				
					res.status(200).json({data:{"result":false,"message":"Contraseña invalida"}});
				}
			})
		}
		else {
			res.status(200).json({data:{"result":false,"message":"Usuario no registrado"}});
		}
	}).catch(async function(error){
		console.log(error);
		res.redirect('https://bk.pampatar.cl');
	})
}
async function socialLogin(req,res){
	const{socialNetId,socialNetName,socialNetAccountName,userId,userEmail,userFirstName,usertLastName,userGenderId,
		userNationalityId,userBirtday,dateTimeLogin}=req.body
		const t = await model.sequelize.transaction();	
	
	//Busca o crea cuenta 
	return await model.Account.findOrCreate({where:{email:userEmail},	transaction:t,
	defaults: {name:socialNetAccountName,email:userEmail,pass:userId,statusId:1,confirmStatus:true}}).
	spread(async function(rsAccount, created) {	
		//busca o crea persona
		document=[];
		document.push({"id":'100',"name":"socialId","number":userId});
		return await model.People.findOrCreate({where:{ id:rsAccount.id},	transaction:t,
				defaults:{ document, firstName: userFirstName,lastName:usertLastName,
				genderId:userGenderId,nationalityId:userNationalityId,birthDate:userBirtday,statusId:1}, 
			}
		).spread(async function(rsPeople, created) {
			//console.log(rsAccount.id);
			if(created){
				await model.Account.update({peopleId:rsPeople.id},{where:{id:rsAccount.id}, transaction: t})
			}
			//Actualiza Ctas Online
			var today=new Date();
			await model.onLineAccount.upsert(
				{ socialNetId, 
				  socialNetName,
				  userId,
				  accountId:rsAccount.id
				}, // Record to upsert
				{ returning: true }     // Return upserted record
			).then(async function(rsOnlineAccount){
				return await accountRole.getRoleByAccount({AccountId:rsAccount.id})  
					.then(async function (rsAccRoles){
						console.log(await generals.thisRole([{"accountId":rsAccount.id},{"roleId":[{"id":6}]}]));
						if(!await generals.thisRole([{"accountId":rsAccount.id},{"roleId":[{"id":6}]}])){
							await accountRole.add({accountId:rsAccount.id,roleId:6,StatusId:1}, {transaction: t})
						}
						if(rsAccRoles.length>0 && await generals.thisRole([{"accountId":rsAccount.id},{"roleId":[{"id":5},{"id":7}]}]) ){							
							var allRole  = [];
							for (let i=0; i<rsAccRoles.length; i++){
								allRole.push({"id":rsAccRoles[i]['Role'].id,"name":rsAccRoles[i]['Role'].name});
							}
							dataPeople= {"id":rsPeople.id,"name":userFirstName,"last":usertLastName}	,
							dataShop=await generals.shopByAccount({accountId:dataAccount.id});
							dataShop['data']['shops'];							
							dataAccount={"id":rsAccount.id,"name":userId,"email":userEmail}
							var token =  await servToken.newToken(rsAccount,{"id":6},ndataShop['data']['shops'],rsPeople,'socialLogin',dateTimeLogin) //generar Token
							t.commit();
							res.status(200).json({data:{"result":true,"message":"Usted a iniciado sesión " + userEmail ,"token":token,"account":dataAccount,"role":allRole,"shop":null,"dateTime":dateTimeLogin}});
						}else{				
							res.status(200).json({data:{"result":false,"message":"Usted no esta autorizado para ingresar a esta sección"}});
						}
					}).catch(async function(error){
						console.log(error);
						t.rollback();
						res.json({"data":{"result":false,"message":"Algo salio mal opteniendo role"}})
					})
			}).catch(async function(error){
				console.log(error);
				t.rollback();
				res.json({"data":{"result":false,"message":"Algo salio mal registrando cuenta Online"}})
			})
		}).catch(async function(error){
			console.log(error);
			t.rollback();
			res.json({"data":{"result":false,"message":"Algo salio mal registrando datos personales"}})
		})
	}).catch(async function(error){
		console.log(error);
		t.rollback();
		res.json({"data":{"result":false,"message":"Algo salio mal registrando cuentas"}})
	})
}
module.exports={add,getOne,edit,activeAccount,forgotPassword,resetPassword,updatePassword,resendConfirmEmail,getRandom,changePassword,
			loginToken,loginBackoffice,socialLogin};