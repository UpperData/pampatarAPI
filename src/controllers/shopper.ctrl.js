const model=require ('../db/models/index');
const generals=require('./generals.ctrl')
const servToken = require('./serviceToken.ctrl');
var jwt=require('jwt-simple');
require('dotenv').config();
var moment = require('moment');
const { Op } = require("sequelize");
const mail= require ('./mail.ctrl');
const bcrypt=require("bcryptjs");

async  function shopRequest(req,res){
	const t = await model.sequelize.transaction();	
	today=new Date();
	y=today.getFullYear();
	mm=today.getMonth();
	d=today.getDay()
	h=today.getHours();
	m=today.getMinutes();
	s=today.getSeconds();
		
	var horaActual=y+'-'+mm+'-'+d+':'+h+':'+m+':'+s;
	req.body.status=[{"id":1,"name":"En Evaluación","date":horaActual}]	
	const token = req.header('Authorization').replace('Bearer ', '')
	if(token){		
		var payload=await generals.currentAccount(token);
		//console.log(payload);
		const AccountId=payload['data']['account'].id;		
		const {document,status,firstName,lastName,
		phone,marca,storeType,startActivity,isStore,
		descShop,salesChannels,affirmations,employees,
		birthDate,genderId,nationalityId}=req.body;
		
		return await model.Account.findAndCountAll({where:{id:AccountId,confirmStatus:true,statusId:1},
		include:[{model:model.People}], transaction: t })
		.then(async function (rsAccount) {
			if (rsAccount.count>0) {
				return await model.People.findOrCreate({where:{id:rsAccount['rows'][0].id},	transaction:t,
					defaults: {document,firstName,lastName,birthDate,genderId,nationalityId,statusId:1}}).
					spread(async function(rsPeople, created) {				
					if(created){
						await model.Account.update({peopleId:rsPeople.id},{where:{id:rsAccount['rows'][0].id}, transaction: t})
					}							
					return await model.shopRequest.findOrCreate({where: {AccountId} ,transaction: t, 
						defaults: {status,phone,marca,storeType,startActivity,isStore,descShop,
									salesChannels,affirmations,employees}})
						.spread(async function(sRequest, created) {
							if (created) {
								const type="shopRequestsView"	  //tipo de TOken (accountId,roles,shops,peoples,type)
								hash=await servToken.newToken(rsAccount,{"id":5,"name":"Comprador"},{sRequest},rsPeople,type) //generar Token 
								var link=process.env.HOST_FRONT+"viewRequest/"+hash; // crea link Para ver Postulación
								var link2=process.env.HOST_FRONT+"viewRequest/"+hash; // crea link Para ver
								var mailsendShoper= mail.sendEmail({
								"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
								"to":rsAccount['rows'][0].email,
								"subject": '.:Tienda Pampatar - Postulación:.',
								"text":"¡Enhorabuena!, Estas aun paso de formar parte de Pampatar",							
								"html": `<!doctype html>
								<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
								<hr style="width: 420; height: 1; background-color:#99999A;">
								<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
							
								<div  align="center">
									<h2 style="font-family:sans-serif; color:#ff4338;" >¡Enhorabuena!</h2>
									<p style="font-family:sans-serif; font-size: 19px;" >Ha solicitado crear una nueva tienda en Pampatar</p>
								
								<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Revisar formulario"></a>
								</div>
								<br><br><br>
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
		
								var mailsendAdmin= mail.sendEmail({
								"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
								"to":process.env.EMAIL_ADMIN_SYS,
								"subject": '.:Nueva Postulación:.',
								"text":"Hay un nuevo postulado",							
								"html": `<!doctype html>
								<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
								<hr style="width: 420; height: 1; background-color:#99999A;">
								<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
							
								<div  align="center">
									<h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva Postulación!</h2>
									<p style="font-family:sans-serif; font-size: 19px;" > ` + firstName +` `+ lastName + ` ha solicitado crear una nueva tienda en Pampatar</p>
								
									<a href="`+link2+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Revisar formulario"></a>
								</div>
								<br>						
									<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
									<br>
									<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
										<p align="center">	
											<a href="https://www.pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://www.pampatar.cl/legal/">Políticas de privacidad</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Términos y condiciones</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
										</p>					
								
										<p  align="center" >
										info@estudiopampatar.cl
												Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
										</p>
									</div>`
								},{ transaction: t })
								if(mailsendAdmin && mailsendShoper)	{
									await t.commit();
									res.json({"data":{"result":true,"message":"Postulación registrada Satisfactoriamente"}})										
								}else{
									await t.rollback()
									res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
								}									
							}else {
								await t.rollback();
								console.error();									
								res.json({"data":{"result":false,"message":"Ya usted posee un postulación en tramite con el número: "+sRequest.id}})
							}        
						}).catch (async function(err) {
								console.log(err);
								await t.rollback();
								res.json({"data":{"result":false,"message":"Algo salió mal, no se pudo procesar su postulación"}})
							
						})
				}).catch(async function(error){
					await t.rollback();
					console.log(error);							
					res.json({"data":{"result":false,"message":"Algo salió mal, actualizando cuenta de usuario"}})
				})
			}else{
				await t.rollback();
				console.log(error);							
				res.json({"data":{"result":false,"message":"Cuenta invalida"}})
			}
		}).catch(async function(error){
			await t.rollback();
			console.log(error);							
			res.json({"data":{"result":false,"message":"Cuenta de usuario no es valida"}})
		})
	}else{
		res.redirect(process.env.HOST_FRONT+'expired/error')
	}
}
async  function validateShop(req,res){
	const {shopName}=req.params
	
	if(shopName.length>3){
		return await model.shop.findAndCountAll({where:{name:{[Op.iLike]: shopName}}})
		.then(async function(rsShop){
			if(rsShop.count>0){
				res.json({"data":{"result":false,"message":"Ya existe una tienda con este nombre, por favor elija otro nombre"}})				
			}else{
				res.json({"data":{"result":true,"message":"El nombre de su tienda está disponible"}})
			}
			res.end();
		}).catch(async function(error){			
			console.log(error)
			res.json({"data":{"result":false,"message":"No fue posible validar la tienda"}})
		})
	}else{
		res.json({"data":{"result":false,"message":"Debe escribir un nombre más descriptivo para su tienda"}})
	}
}
async  function getShopRequestByStatus(req,res){
	const{id}=req.params	
	return await model.shopRequest.findAndCountAll({ where:{status:{"id":1}}})
	.then(async function(rsShopRequest){
		if(rsShopRequest.count>0){
			res.json({"data":{"result":true,"rows":rsShopRequest['rows']}})
		}else{
			res.json({"data":{"result":false,"message":"No hay ninguna solicitud en este estatus"}})
		}
	}).catch(async function(error){
		console.log(error)
		res.json({"data":{"result":false,"message":"Algo salió mal opteniendo postulación"}})
	})
}
async function shopRequestView(req,res){
	const{id}=req.params
	const  accountCurrent= await generals.currentAccount(id);	
	if(accountCurrent){	
		return await model.shopRequest.findOne({ 
			attributes:{exclude:['createdAt']},
			where:{id:accountCurrent['data']['shop'].sRequest.id,AccountId:accountCurrent['data']['account']['rows'][0].id}
		}).then(async function(rsShopRequest){
			res.json({"data":{"result":true,rsShopRequest}})
		}).catch(async function(error){
			console.log(error)
			res.json({"data":{"result":false,"message":"Algo salió mal opteniendo postulación"}})
		})
	}else{
		res.json({"data":{"result":false,"message":"El contenido que sea ver ya no esta disponible"}})
	}
}
async function getShopperProfile(req,res){
	//const {AccountId}=req.params;
	const token = req.header('Authorization').replace('Bearer ', '');
	if(token){
		var payload=await generals.currentAccount(token);
		const AccountId=payload['data']['account'].id;
		const t = await model.sequelize.transaction();
		return await model.Account.findOne({
			attributes:['id','email','preference'],
			where:{id:AccountId},
			include:[
				{
					model:model.People,
					attributes:['firstName','lastName','document','birthDate'],
					include:[
						{
							model:model.Genders,
							attributes:['id','name']
						},
						{
							model:model.Nationalities,
							attributes:['id','name']
						}
					]
				}
			],
			transaction:t
		}).then(async function(rsProfile){
			t.commit();
			res.json(rsProfile);
		}).catch(async function (error){
			console.log(error)
			t.rollback()
			res.json({"data":{"result":false,"message":"Algo salió mal retronando perfil de usuario, intente nuevamente"}})
		})
	}else{
		res.json({"data":{"result":false,"message":"Su token no es valido"}})
	}
}
async function updateShopperProfile(req,res){
	const {preference,firstName,lastName,document,genderId,nationalityId,birthDate}=req.body
	const token = req.header('Authorization').replace('Bearer ', '');
	var payload=await generals.currentAccount(token);
	const AccountId=payload['data']['account'].id;
	const t = await model.sequelize.transaction();  
	return await model.Account.findOne({ //Vaida existencia de a cuenta
		attributes:['id','preference'],
		where:{id:AccountId},
		include:[
			{
				model:model.People,
				attributes:['id','firstName','lastName','document','genderId','nationalityId','birthDate'],
				include:[
					{
						model:model.Genders,
						attributes:['id','name']
					},
					{
						model:model.Nationalities,
						attributes:['id','name']
					}
				]
			}
		],
		transaction:t
	}).then(async function(rsProfile){
		console.log(rsProfile);
		//console.log(rsProfile['Person'].id);
		if(preference!=null){ //Actualiza Infromación de personal
			return await model.Account.update({preference}, {where:{id:rsProfile.id},transaction:t})
			.then(async function(rsAccount){
				if(rsProfile['Person']==null){ //Registra Infromación personal
					if(firstName!=null,lastName!=null,document!=null,genderId>0,nationalityId>0,birthDate!=null){
						return await model.People.create({firstName,lastName,document,genderId,nationalityId,birthDate},{transaction:t})
						.then(async function (rsrPeopleAdd){
							//Actualiza cuenta
							return await model.Account.update({peopleId:rsrPeopleAdd.id}, {where:{id:rsProfile.id},transaction:t})
							.then(async function (rsAccountUd){
								t.commit();
								res.json({"data":{"result":true,"message":"Perfil actuaizado satisfactoriamente"}})
							}).catch(async function(error){
								t.rollback();
								res.json({"data":{"result":true,"message":"Algo salió mal actualizando persona en cuenta"}})
							})
						}).catch(async function (error){
							t.rollback();
							res.json({"data":{"result":true,"message":"Algo salió mal registrando sus datos personales, intente nuevamente"}})
						})
					}else{
						t.rollback();
						res.json({"data":{"result":true,"message":"Verifique los datos del formulario"}})
					}
				}else{
					if(firstName!=null,lastName!=null,document!=null,genderId>0,nationalityId>0,birthDate!=null){
						return await model.People.update({firstName,lastName,document,genderId,nationalityId,birthDate}, {where:{id:rsProfile['Person'].id}},{transaction:t})
						.then(async function (rsPeople){
							t.commit();
							res.json({"data":{"result":true,"message":"Perfil actuaizado satisfactoriamente"}})
						}).catch(async function (error){
							console.log(error);
							t.rollback();
							res.json({"data":{"result":false,"message":"Algo salió mal actualizando datos personales"}})
						})
					}else{
						t.rollback();
						res.json({"data":{"result":true,"message":"Verifique los datos del formulario"}})
					}
				}
			}).catch(async function (error){
				console.log(error);
				t.rollback();
				res.json({"data":{"result":false,"message":"Algo salió mal actualizando cuenta de usuario"}})
			})
		}else{
			t.rollback();
			res.json({"data":{"result":false,"message":"Debe registrar sus preferencias para poder actualizar"}})
		}
	}).catch(async function (error){
		console.log(error)
		t.rollback();
		res.json({"data":{"result":false,"message":"Algo salió mal retornando perfil de usuario, intente nuevamente"}})
	})
}
async function updateShopperEmail(req,res){ // envia Email para cambio de Email
	const {newEmail,pass}=req.body
	const token = req.header('Authorization').replace('Bearer ', '');
	var payload=await generals.currentAccount(token);
	const AccountId=payload['data']['account'].id;
	payload['data']['account'].email=newEmail;
	const t = await model.sequelize.transaction();
	return await model.Account.findAndCountAll({ //Vaida existencia de a cuenta
		attributes:['id','pass','email','preference','statusId'],
		where:{email:newEmail}})
	.then(async function (rsValidaEmail){
		if(rsValidaEmail.count==0){
			return await model.Account.findOne({ //Vaida existencia de a cuenta
				attributes:['id','pass','email','preference','statusId'],
				where:{id:AccountId},
				include:[
					{
						model:model.People,
						attributes:['id','firstName','lastName','document','genderId','nationalityId','birthDate'],
						include:[
							{
								model:model.Genders,
								attributes:['id','name']
							},
							{
								model:model.Nationalities,
								attributes:['id','name']
							}
						]
					}
				],
				transaction:t
			}).then(async function(rsProfile){
				return await  bcrypt.compare(pass,rsProfile.pass) // Valida que la contraseña se valida para evitar que alquien más cambien el email
				.then(async  function (rsPass){
					if(rsProfile.statusId==1){			
						if(rsProfile.id && rsPass){ //Actualiza Infromación de la Cuenta
							//Genera Token
							var token =  await servToken.newToken(payload['data']['account'],payload['data']['role'],payload['data']['shop'],payload['data']['people'],'updateEmail') //generar Token 	
							return await model.Account.update({hashConfirm:token}, {where:{id:rsProfile.id},transaction:t}) //Regsitra token
							.then(async function(rsAccount){
								var link=process.env.HOST_BACK +'shoppeR/chANgemail/'+token
								var mailsend= mail.sendEmail({
									"from":'"Pampatar" <'+ process.env.EMAIL_ADMIN +'>', 
									"to":newEmail,
									"subject": '.:Pampatar Validación de Correo Electrónico:.',
									"html": `<!doctype html>
									<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
									<hr style="width: 420; height: 1; background-color:#99999A;">
									<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
									
									<div  align="center">
										<h2 style="font-family:sans-serif; color:#ff4338;" >¡Validación Correo Electrónico!</h2>
										<p style="font-family:sans-serif; font-size: 19px;" > Debe validar el cambio de Correo Electrínico haceindo click en  el sigueite link </p>
									
										
										<a href="`+ link +`">VALIDAR CAMBIO DE CORREO ELECTRÓNICO</a>
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
									if(mailsend)	{
										await t.commit();
										res.json({"data":{"result":true,"message":"Cambio de Correo Electrónico procesado satisfactoriamente, ingrese a su email para completar el cambio"}})										
									}else{
										await t.rollback()
										res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
									}
							}).catch(async function (error){
								console.log(error);
								t.rollback();
								res.json({"data":{"result":false,"message":"Algo salió mal actuaizando cuenta de usuario"}})
							})
						}else{
							t.rollback();
							res.json({"data":{"result":false,"message":"Cuenta invalida"}})
						}
					}else{
						t.rollback();
						res.json({"data":{"result":false,"message":"Cuenta inactiva"}})
					}
				}).catch(async function (error){
					console.log(error);
					t.rollback();
					res.json({"data":{"result":false,"message":"Algo salió mal validando cuenta de usuario"}})
				})
			}).catch(async function (error){
				console.log(error);
				t.rollback();
				res.json({"data":{"result":false,"message":"Algo salió mal opteniendo cuenta de usuario"}})
			})
		}else{
			res.json({"data":{"result":false,"message":"Intente nuevamente con otro Correo Electrónico, ya esta registrado en el sistema"}})
		}
	}).catch(async function (error){
		console.log(error);
		t.rollback();
		res.json({"data":{"result":false,"message":"Algo salió mal validando nuevo correo electrónico"}})
	})

}
async function accountEmailUpdate(req,res){
	const {tokenUpdate}=req.params
	const t = await model.sequelize.transaction();
	//const token = req.header('Authorization').replace('Bearer ', '');
	if(tokenUpdate){
		var payload=await generals.currentAccount(tokenUpdate);
		const t = await model.sequelize.transaction();
		if(payload['data']['type']=="updateEmail"){
			return await model.Account.update({email:payload['data']['account'].email}, {where:{id:payload['data']['account'].id},transaction:t}) //Regsitra token
			.then(async function(rsAccount){
				if(rsAccount){
					var mailsend= mail.sendEmail({
					"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
					"to":payload['data']['account'].email,
					"subject": '.:Pampatar - Cambio de Correo Electrónico:.',
					"html": `<!doctype html>
					<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
					<hr style="width: 420; height: 1; background-color:#99999A;">
					<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
				
					<div  align="center">
						<h2 style="font-family:sans-serif; color:#ff4338;" >¡Cambio de Correo Electrónico!</h2>
						<p style="font-family:sans-serif; font-size: 19px;" > Usted a cambio a su dirección de correo electronico satisfactoriamente </p>
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
					if(mailsend)	{
						await t.commit();
						res.redirect(process.env.HOST_FRONT+'newemaIL/');	
						res.json({"data":{"result":true,"message":"Correo electrónico modificado  Satisfactoriamente"}})										
					}else{
						await t.rollback()
						res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
					}
					
				}else{

				}
			})
		}else{
			await t.rollback()
			res.json({"data":{"result":false,"message":"Token invalido para cambio de correo"}})
		}	
	}else{
		await t.rollback()
		res.redirect(process.env.HOST_FRONT+'exPiRED/erroR');	
		res.json({"data":{"result":false,"message":"Token invalido"}})
	}
}
module.exports={shopRequest,validateShop,getShopRequestByStatus,shopRequestView,getShopperProfile,updateShopperProfile,
				accountEmailUpdate,updateShopperEmail}
