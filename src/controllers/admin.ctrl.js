const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
const { Op } = require("sequelize");
require ('dotenv').config();
const generals=require('./generals.ctrl');
//  HOST_BACK ->> VARAIBLES DE ENTORNO DE LA API
//  HOST_FRONT ->> VARAIBLES DE ENTORNO DEL FRONTEND

var today=new Date();
async function preShop(req,res) { //Preaprobación de la Tienda	
const t = await model.sequelize.transaction();  	
	const{  
	shopRequestId,
	action	
	}=req.body;	
	var newStatus={};
	if(action=="pre"){
		newStatus={"id":5,"name":"Pre-Aprobado","date":today};
	}
	if(action=="deny"){
		newStatus={"id":3,"name":"Negada","date":today};
	}
	const account=await generals.currentAccount(req.header('Authorization').replace('Bearer ', ''));
	//dataToken['data']['account'].email
	return await model.shopRequest.findAll({ where: {id: shopRequestId} ,  // CONSULTA POSTULACION
		include: [{
        	model: model.Account,
			 where:{statusId:1}
		}],transaction: t })
	.then(async function(rsShopRequest) {
		
		var r= rsShopRequest[0].status.filter(st=>st.id==1).length; //Pre-Aprobado 
		var r1= rsShopRequest[0].status.filter(st=>st.id==2).length;
		var r2= rsShopRequest[0].status.filter(st=>st.id==3).length;
		var r3= rsShopRequest[0].status.filter(st=>st.id==4).length;
		var r4= rsShopRequest[0].status.filter(st=>st.id==5).length;
		if(r==1 && r1<1 && r2<1 && r3<1 && r4<1 )	{	// 1== En Evaluación

					//ACTAULIZA ESTATUS DE LA POSTULACIÓN

			rsShopRequest[0].status.push(newStatus); // Actualiza registro JSON para estatus de la Postulación			
			await model.shopRequest.update({status:rsShopRequest[0].status},{where:{id: shopRequestId},transaction: t}) // Actualiza la postulación
			.then(async function(rsUpdate){			
				if(rsUpdate){	
					//Envia Email de notificación  	
					var mailsendShopper=mail.sendEmail({
						"from":'Pampatar <upper.venezuela@gmail.com>', 
						"to":rsShopRequest[0]['Account'].email,
						"subject": '.:TIENDA '+newStatus.name +':.',
						"html":`<!doctype html>
						<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
						<hr style="width: 420; height: 1; background-color:#99999A;">
						<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
					
						<div  align="center">
							<h2 style="font-family:sans-serif; color:#ff4338;">Pampatar</h2>
							<p style="font-family:sans-serif; font-size: 19px;" > ¡Tu solictidtud de tienda en Pampatar ha sido <b>`+ newStatus.name +`</b>!</p>						
							<a href="`+process.env.HOST_FRONT+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Ir a Pampatar.cl"></a>
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
						if(mailsendShopper){
							await t.commit(); 
							res.json({"data":{"result":true,"message":"Solicitud procesada satisfactoriamente"}})		
						}	
				}
			}).catch(async function(error){
				await t.rollback();	
				console.log(error)
				res.json({"data":{"result":false,"message":"No fue posible actualizar estatus de la Postulación, intente nuevamente"}})		

			})
		}else{
			await t.rollback();	
			res.json({"data":{"result":false,"message":"Postulación ha sido procesada anteriormente"}})
		}	
	}).catch(async function(error){ // Validando Postulacion
		console.log(error)
		res.json({"data":{"result":false,"message":"No fue posible validar la postulación"}})
		await t.rollback();	
	})
}
async function shopContract(req,res){
	const{
		shopRequestId,
		contractDesc,
		attachment,
		servPercen,
		proPercen
	}=req.body	
	if(contractDesc==null || attachment==null || servPercen==null || proPercen==null){
		res.status(404).json({"data":{"result":false,"message":"Faltan volares requeridos en el formulario"}})
	}
	else{
		const shopRequestStatus={"id":2,"date":today,"name":"Aprobada"};
		const t = await model.sequelize.transaction();	
		return await model.shopRequest.findAll({where:{id:shopRequestId}, 
			include:[{
				model:model.Account,
				require:true,
					where:{statusId:1},
						include:[{
							model:model.People,
							require:true
						}]	
			}]
		}).then(async function(rsShopRequest){
			//console.log(rsShopRequest);
			var r= rsShopRequest[0].status.filter(st=>st.id==2).length;	// Aprobada
			var r1= rsShopRequest[0].status.filter(st=>st.id==5).length; // Pre-Aprobada
			if (r==0 && r1>0 ){ // si la Postulación no a sido aprobada y esta pre-aprobada
				var status={};
				const phone=rsShopRequest[0].phone;
				const name=rsShopRequest[0].marca;
				const storeType=rsShopRequest[0].storeType;
				const startActivity=rsShopRequest[0].startActivity;
				const isLocal=rsShopRequest[0].isStore;
				const shopDescription=rsShopRequest[0].descShop;
				const salesChannels=rsShopRequest[0].salesChannels;
				const affirmations=rsShopRequest[0].affirmations;
				const employees=rsShopRequest[0].employees;
				status=rsShopRequest[0].status;		
				attachment.tags.push({"name":rsShopRequest[0].marca});	
				const accountId=rsShopRequest[0]['Account'].id	
						
				status.push(shopRequestStatus);
				//Actualiza status de postulacion
				await model.shopRequest.update({status},{where:{id:rsShopRequest[0].id}},{transaction:t})
				.then(async function(rsUpdate){
					//registra el contrato
					return await model.attachment.create({data:attachment.data,tags:attachment.tags},{transaction:t})
					.then(async function(rsAttachment){
						//Crea la tienda
						return await model.shop.create({phone,name,accountId,shopRequestId:rsShopRequest[0].id,storeType,startActivity,isLocal,shopDescription,salesChannels,affirmations,employees},{transaction:t})					
						.then(async function(rsShop){
							//Asocia el contrato a la tienda
							return await model.shopContract.create({contractId:rsAttachment.id,shopId:rsShop.id,statusId:1,contractDesc,servPercen,proPercen},{transaction:t})
							//return await model.shopContract.upsert({contractId:rsAttachment.id,shopId:rsShop.id,statusId:1,contractDesc,percen},{transaction:t})
							.then(async function(shopContracts){
								if(shopContracts.id>0){
									//CREA ALMACEN POR DEFECTO
									return await model.Warehouse.create({name:"Pampatar",phone:process.env.PAMAPTAR_PHONE,address:process.env.PAMPATAR_ADDRESS,shopId:rsShop.id,statusId:1},{transaction:t})
									//return await model.Warehouse.upsert({name:"Pampatar",phone:process.env.PAMAPTAR_PHONE,address:process.env.PAMPATAR_ADDRESS,shopId:rsShop.id,statusId:1},{transaction:t})
									.then(async function(rsWarehouse){
										//Consede rol vendedor al usuario
										try{
											// verifiac si ya tiene el rol vendedor
											const qtyRoles=await model.accountRoles.findAndCountAll({
												attributes:['id'],
												where:{AccountId:accountId,RoleId:5}
											})
											console.log(qtyRoles);
											// si no tiene rol vendedor se lo consede
											if(qtyRoles.count<1){ 
												const newAccountRole= await model.accountRoles.create({"AccountId":accountId,"RoleId":5,"StatusId":1},{ transaction: t }) // Consede rol de Comprador
											}
											
										}catch(error){
											console.log(error);
											await t.rollback();
											res.json({data:{"result":false,"message":"Algo salió mal consediendo permiso de vendedor"}})
										}
											var title="¡ENHORABUENA!";
											var content="Hemos aprobado tu tienda', ¡Ya eres parte de nuestro equipo!";									
											var btn='<a href="'+process.env.HOST_FRONT+'" class="btn btn-primary shadow font-weight-bold">Ingresar a tu tienda Pampatar</a>'										
											var mailsend= await mail.sendEmail({
												"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
												"to":rsShopRequest[0]['Account'].email,
												"subject": '.:Tienda Pampatar '+ shopRequestStatus.name +' :.',						
												"html":`<!doctype html>
												<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
												<hr style="width: 420; height: 1; background-color:#99999A;">
												<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
											
												<div  align="center">
													<h2 style="font-family:sans-serif; color:#ff4338;">`+ title +`</h2>
													<p style="font-family:sans-serif; font-size: 19px;" > `+ content +`</p>						
													`+ btn +`
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
												},{ transaction: t });
											if(mailsend){
												await t.commit();
												res.json({data:{"result":true,"message":"Contrato registrado satisfactoriamente, La tienda "+ rsShop.name +" fue creada con exito"}})
											}else{
												await t.rollback();
												console.log(error);
												res.json({data:{"result":false,"message":"Algo salió mal  enviado notificaión, intente nuevamente"}})
											}
									}).catch(async function(error){
										console.log(error);
										await t.rollback();
										res.json({data:{"result":false,"message":"Algo salió mal creando almacén Pampatar, intente nuevamente"}})
									})							
								}else{
									await t.rollback();
									console.log(error);
									res.json({data:{"result":false,"message":"Algo salió mal identificando tienda, intente nuevamente"}})
								}
							}).catch(async function(error){
								await t.rollback();
								console.log(error)
								res.json({data:{"result":false,"message":"Algo salió mal  asignando contrato, intente nuevamente"}})
							})	
						}).catch(async function(error){
							if(error.name="SequelizeUniqueConstraintError"){
								await t.rollback();
								console.log(error);
								res.json({data:{"result":false,"message":"Ya existe una tienda registrada con el mismo nombre"}})
							}else{
								await t.rollback();
								console.log(error);
								res.json({data:{"result":false,"message":"Algo salió mal creando tienda, intente nuevamente"}})
							}
						})
					}).catch(async function(error){
						await t.rollback();
						console.log(error)
						res.json({data:{"result":false,"message":"Algo salió mal  registrando contrato, intente nuevamente"}})
					})
				}).catch(async function(error){
					await t.rollback();
					console.log(error)
					res.json({data:{"result":false,"message":"Algo salió mal actualizando el estatus de la postulación"}})
				})
			}else{
				await t.rollback();			
				res.json({data:{"result":false,"message":"La postulación indicada ya a sido aprobada anteriormente"}})
			}

		}).catch(async function(error){
			await t.rollback();
			console.log(error);
			res.json({data:{"result":false,"message":"No fue posible identificar Postulación, intente nuevamente"}})
		})
	}
}


async function getShopRequestInEvaluation(req,res){
	return await model.shopRequest.findAll({ 
		where: {
			[Op.not]:[{
				status:{					
					[Op.contains]:[{id:5}]
				}
			}]
			
		},
		include:[{
			model:model.Account,
			include:[{
				model:model.People,				
				include:[{					
					model:model.Nationalities
				},
				{
					model:model.Genders
				}]
			}]
		}]
	})
	.then(async function(rsShopRequestByStatus){
		console.log(rsShopRequestByStatus);
		//console.log(rsShopRequestByStatus['rows'])
		//var r= rsShopRequestByStatus.status.filter(st=>st.id==2).length;	
		//console.log(r);
		res.json({rsShopRequestByStatus
				//"id":rsShopRequestByStatus['shopRequest']['Account'].id,
				/*"phone":rsShopRequestByStatus[0].phone,
				"name":rsShopRequestByStatus[0].marca,
				"storeType":rsShopRequestByStatus[0].storeType,
				"startActivity":rsShopRequestByStatus[0].startActivity,
				"isStore":rsShopRequestByStatus[0].isStore,
				"descShop":rsShopRequestByStatus[0].descShop,
				"salesChannels":rsShopRequestByStatus[0].salesChannels,
				"affirmations":rsShopRequestByStatus[0].affirmations,			
				"employees":rsShopRequestByStatus[0].employees,			
				"employees":rsShopRequestByStatus[0].employees,	
				"dacreatedAtte":rsShopRequestByStatus[0].createdAt
			},
			"account":{
				"email":rsShopRequestByStatus[0]['Account'].email,
				"preference":rsShopRequestByStatus[0]['Account'].preference,
				"createdAt":rsShopRequestByStatus[0]['Account'].createdAt
			},
			"people":{
				"firstName":rsShopRequestByStatus[0]['Account']['Person'].firstName,
				"lastName":rsShopRequestByStatus[0]['Account']['Person'].lastName,
				"document":rsShopRequestByStatus[0]['Account']['Person'].document,
				"birthDate":rsShopRequestByStatus[0]['Account']['Person'].birthDate,
				"nationality":rsShopRequestByStatus[0]['Account']['Person']['Nationality'].name,
				"gender":rsShopRequestByStatus[0]['Account']['Person']['Gender'].name
			}*/
		})
	}).catch(async function (error){	
		console.log(error);	
		res.json({"data":{"result":false,"message":"Algo salió mal encontrando postulaciones"}})
	})
}
async function getShopRequestPreAproved(req,res){
	return await model.shopRequest.findAll({ 
		where: {
			[Op.not]:[{
				status:{					
					[Op.contains]:[{id:2}]
				}
			}],
			status:{					
				[Op.contains]:[{id:5}]
			}
		},
		include:[{
			model:model.Account,
			include:[{
				model:model.People,
				
				include:[{
					
					model:model.Nationalities
				},
				{
					model:model.Genders
				}]
			}]
		}]
	})
	.then(async function(rsShopRequestByStatus){
		//console.log(rsShopRequestByStatus);
		//console.log(rsShopRequestByStatus[0]['Account'])
		if(rsShopRequestByStatus.length>0){
			res.json({rsShopRequestByStatus
				/*
				"shopRequest":{
					"id":rsShopRequestByStatus[0].id,
					"phone":rsShopRequestByStatus[0].phone,
					"name":rsShopRequestByStatus[0].marca,
					"storeType":rsShopRequestByStatus[0].storeType,
					"startActivity":rsShopRequestByStatus[0].startActivity,
					"isStore":rsShopRequestByStatus[0].isStore,
					"descShop":rsShopRequestByStatus[0].descShop,
					"salesChannels":rsShopRequestByStatus[0].salesChannels,
					"affirmations":rsShopRequestByStatus[0].affirmations,			
					"employees":rsShopRequestByStatus[0].employees,			
					"employees":rsShopRequestByStatus[0].employees,	
					"dacreatedAtte":rsShopRequestByStatus[0].createdAt
				},
				"account":{
					"email":rsShopRequestByStatus[0]['Account'].email,
					"preference":rsShopRequestByStatus[0]['Account'].preference,
					"createdAt":rsShopRequestByStatus[0]['Account'].createdAt
	
				},
				"people":{
					"firstName":rsShopRequestByStatus[0]['Account']['Person'].firstName,
					"lastName":rsShopRequestByStatus[0]['Account']['Person'].lastName,
					"document":rsShopRequestByStatus[0]['Account']['Person'].document,
					"birthDate":rsShopRequestByStatus[0]['Account']['Person'].birthDate,
					"nationality":rsShopRequestByStatus[0]['Account']['Person']['Nationality'].name,
					"gender":rsShopRequestByStatus[0]['Account']['Person']['Gender'].name
				}          */ 
			  
			})
		}else{
			res.json({"data":{"result":true,"message":"No hay postulaciones pendientes por aprobación"}})
		}	
		
	}).catch(async function (error){	
		console.log(error)	;
		res.json({"data":{"result":false,"message":"Algo salió mal encontrando postulaciones"}})
	})
}
async function getContractByShop (req,res){
	const{shopId}=req.params
	return await model.shopContract.findAll({where:{shopId},	
		include:[
			{
				model:model.shop,
				attributes:['id','name','phone', 'shopRequestId'],
				require:true
			},
			{
				model:model.attachment, as:'contract' ,
				attributes:['data'],
				require:true
			}
		]
	})
	.then(async function(rsShopContract){
		res.json({"data":{"result":true,rsShopContract}})
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal buscando contrato de la tienda"}})
	})
}
async function getShopAll (req,res){	
	return await model.shop.findAll({attributes:['id','name','phone','partner','address','processId','createdAt','startActivityAttachment','storeType','logo'],

		include:[{
			model:model.Status,	
			attributes:['name'],		
			require:true
		}]
	})
	.then(async function(rsShopAll){
		res.json({"data":{"result":true,rsShopAll}});
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal buscando las tiendas"}});
	})
}
async function getShopByName (req,res){
	const {nShop} =req.params;
	return await model.shop.findAll({attributes:['id','name','phone','partner','address','processId','createdAt','startActivityAttachment','storeType','logo'],
		where:{name:{
				[Op.iLike]: '%'+nShop+'%'}
			},
			include:[{
				model:model.Status,	
				attributes:['name'],		
				require:true
			}]
		}
	)
	.then(async function(rsShopName){
		res.json({"data":{"result":true,rsShopName}});
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal buscando las tiendas"}});
	})
}
async function getProfileShop(req,res){	
	
	const {shopId}=req.params;
	return await model.shop.findAll({ attributes:['id','name','phone','partner','address','processId','createdAt','startActivityAttachment','storeType','logo'],
	where:{id:shopId},
		include:[{
			model:model.Status,	
			attributes:['name'],		
			require:true
		},
		{
			model:model.shopRequest,	
			attributes:['id'],		
			require:true,
			include:[{
				model:model.Account,
				attributes:['id','name','email','preference','createdAt'],
				require:true,
				include:[{
					model:model.People,
					attributes:['id','firstName','lastName','document','birthDate','createdAt'],
					require:true,
					include:[{
						model:model.Genders,
						attributes:['id','name']
					},{
						model:model.Nationalities,
						attributes:['id','name']
					}
				]
				}]
			}]
		}
		]
	})
	.then(async function(rsAccount){
	  res.json({"data":{"result":true,rsAccount}});
	}).catch(async function(error){
	  console.log(error);
	  res.json({"data":{"resul":false,"message":"Algo salió generando perfil, intente nuevamente"}})
	})
  }
async function taxUpdate(req,res){
	const{taxId,value}=req.body;
	//valida que existe el tax
	
	const t = await model.sequelize.transaction();  	
	await model.tax.findOne({where:{id:taxId}},{transaction:t})
	.then(async function(rsTax){
		if(rsTax && value>0){
			await model.taxValue.update({StatusId:2},{where:{taxId}},{transaction:t})
			.then(async function(rsTaxValueUp){
				await model.taxValue.create({taxId:rsTax.id,value,StatusId:1},{transaction:t})
				.then(async function(rsTaxValue){
					t.commit();
					res.json({"data":{"result":true,"message":"Impuesto actualizado satistactoriamente"}})					
				}).catch(async function(error){
					console.log(error);
					t.rollback();
					res.json({"data":{"result":false,"message":"Algo salió mal asignando nuevo valor de impuesto"}})
				})
			}).catch(async function(error){
				console.log(error);
				t.rollback();
				res.json({"data":{"result":false,"message":"Algo salió mal asignando actualizando status de impuesto"}})
			})
		}else{
			t.rollback();
			res.json({"data":{"result":false,"message":"Impuesto o valor ingresado no es valido"}})
		}
	}).catch(async function(error){
		console.log(error);
		t.rollback();
		res.json({"data":{"result":false,"message":"Algo salió mal identificando impuesto"}})
	})
}

async function getTaxCurrents(req,res){
	await model.tax.findAll({attributes:['id','name'],
	include:[{
		model:model.taxValue,
			attributes:['id','value','createdAt'],
			required:true,
			where:{StatusId:1}
		}]

	})
	.then(async function(rsTax){
		res.json(rsTax);
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retornando impuestis"}})
	})
}
async function getTaxHistory(req,res){
	const{taxId}=req.params;	
	await model.tax.findAll({attributes:['id','name'],		
		include:[{
			model:model.taxValue,
			attributes:['id','value','createdAt'],
			required:true,
			where:{taxId},		
			include:[{
				model:model.Status,
				attributes:['id','name'],
				required:true
			}]
		}]
	
	})
	.then(async function(rsTax){
		res.json(rsTax);
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retornando historial de impuesto"}})
	})
}
async  function getShopRequestAll(req,res){	
	return await model.shopRequest.findAndCountAll({ 
		
		include:[
			{
				model:model.Account,
				attributes:['id','name','email'],
				required:true,
				include:[
					{
						model:model.People,	
						attributes:{exclude:['createdAT','updatedAt']},
						required:true}
				]
			}
		]
	})
	.then(async function(rsShopRequest){
		rsShopRequest.count
		if(rsShopRequest.count>0){
			res.json(rsShopRequest)
		}else{
			res.json({"data":{"result":false,"message":"No hay postulaciones registradas"}})
		}
	}).catch(async function(error){
		console.log(error)
		res.json({"data":{"result":false,"message":"Algo salió mal opteniendo postulación"}})
	})

}
async function editShopContract(req,res){
	const{id,
		contractDesc,
		attachment,
		servPercen,
		proPercen,
		statusId

	}=req.body
	const t = await model.sequelize.transaction();  
	return await model.shopContract.findOne({where:{id}},{transaction:t})
	.then(async function(rsShopContract){ // valida exitencia del contrato
		//console.log(rsShopContract);
		if(rsShopContract){		
			return await model.attachment.update({data:attachment.data},{where:{id:rsShopContract.contractId}},{transaction:t}) // Actualiza Archivo Digital
			.then(async function(rsAttachment){
				return await model.shopContract.update({contractDesc,servPercen,proPercen,statusId},{where:{id}},{transaction:t}) // Actualiza Valores generales
				.then(async function (error){
					t.commit();
					res.json({"data":{"result":true,"message":"Contrato actualizado satisfactoriamente"}})
				}).catch(async function(error){
					console.log(error);
					t.rollback();
					res.json({"data":{"result":false,"message":"Algo salió mal actualizando descripción del contrato"}})
				})
			}).catch(async function(error){
				console.log(error);
				t.rollback();
				res.json({"data":{"result":false,"message":"Algo salió mal actualizando archivo"}})
			})
		}else{
			t.rollback();
			res.json({"data":{"result":false,"message":"El contrato indicado no existe"}})
		}
	}).catch(async function(error){
		t.rollback();
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal validando contrato"}})
	})
}
async function getShopByContractStatus(req,res){
	const{StatusId}=req.params
	return await model.shopContract.findAll({
		attributes:['id','contractId','contractDesc','proPercen','servPercen','statusId'],
		where:{statusId:StatusId},
		include:[
			{
				model:model.shop				
			}
		]
	}).then(async function(rsShopByStatus){
		res.json(rsShopByStatus);
	}).catch(async function(error){
		res.json({"data":{"result":false,"message":"Algo salió mal retornando resultados"}})
	})
}
async function shopDisable(req,res){ // Deshabilitar tienda
	const{shopId}=req.body;
	const t = await model.sequelize.transaction();  	
	return await model.shop.findOne({ // valida su existe la teinda
		attributes:['id','name'],
		where:{id:shopId,statusId:1},
		include:[
			{
				model:model.shopRequest,
				attributes:['id'],
				include:[
					{
						model:model.Account,
						attributes:['id','email']
					}
				]
			},
			{
				model:model.Status,
				attributes:['id']
			}
		],
		transaction:t
	})
	.then(async function(rsFnShop){	
		if(rsFnShop){
			return await model.shopContract.update({statusId:2},{where:{shopId:rsFnShop.id},transaction:t}) // Deshabilita el contrato
		.then(async function(rsShopContract){			
				return await model.shop.update({statusId:2},{where:{id:rsFnShop.id},transaction:t}) // deshabilita la tienda
				.then(async function(rsShop){					 
					return await model.accountRoles.update( // deshabilita el role de vendedor
						{StatusId:2}, 
						{where:{AccountId:rsFnShop['shopRequest']['Account'].id,RoleId:5}}
					).then(async function(rsRoleAccount){						
						var mailsend= await mail.sendEmail({ //envia notificación de correo
							"from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', 
							"to":rsFnShop['shopRequest']['Account'].email,
							"subject": '.:Tienda Pampatar '+ rsFnShop.name +' a sido deshabilitada:.',
							"html":`<!doctype html>
							<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
							<hr style="width: 420; height: 1; background-color:#99999A;">
							<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
							<div  align="center">
								<h2 style="font-family:sans-serif; color:#ff4338;"> Tienda <b>` +  rsFnShop.name  + `</b> a sido dada de baja</h2>
								<p style="font-family:sans-serif; font-size: 19px;" > El adminstrador de Pampatar le ha dado de baja, para habilitar nuevamente su tienda debe comunicarse por correo eléctronico a la dirección:<b>  `+ process.env.EMAIL_INFO + `  </b>donde será atendido a la brevedad posible </p>	
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
							},{ transaction: t });
						if(mailsend){
							await t.commit();							
							res.json({"data":{"result":true,"Message":"se a dado de baja a la tienda " + rsFnShop.name  +"  satisfactoriamente"}})
						}else{
							await t.rollback();
							console.log(error);
							res.json({data:{"result":false,"message":"Algo salió mal enviado correo de notificaión, intente nuevamente"}})
						}
					}).catch(async function(error){
						t.rollback();
						console.log(error);
						res.json({"data":{"result":false,"message":"Algo salió mal deshabilitando role, intente nuevamente"}})	
					})
					
				}).catch(async function(error){
					t.rollback();
					console.log(error);
					res.json({"data":{"result":false,"message":"Algo salió mal intentando procesar su petición, intente nuevamente"}})	
				})
		}).catch(async function(error){
			await t.rollback();
			console.log(error);
			res.json({data:{"result":false,"message":"Algo salió mal actializando estatus de contrato, intente nuevamente"}})
		})
		}else{
			res.json({"data":{"result":false,"message":"Tienda no existe o esta deshabilitada"}})
		}
		
	}).catch(async function (error){
		await t.rollback();
		console.log(error);
		res.json({data:{"result":false,"message":"Algo salió mal actializando estatus de tienda, intente nuevamente"}})
	})
}
async function shopEnable(req,res){ // Habilitar tienda
	const{shopId}=req.body;
	const t = await model.sequelize.transaction();  	
	return await model.shop.findOne({ // valida su existe la tienda
		attributes:['id','name'],
		where:{id:shopId,statusId:2},
		include:[
			{
				model:model.shopRequest,
				attributes:['id'],
				include:[
					{
						model:model.Account,
						attributes:['id','email']
					}
				]
			},
			{
				model:model.Status,
				attributes:['id']
			}
		],
		transaction:t
	})
	.then(async function(rsFnShop){	
		if(rsFnShop){
			return await model.shopContract.update({statusId:1},{where:{shopId:rsFnShop.id},transaction:t}) // Habilita el contrato
		.then(async function(rsShopContract){			
				return await model.shop.update({statusId:1},{where:{id:rsFnShop.id},transaction:t}) // Habilita la tienda
				.then(async function(rsShop){						
					return await model.accountRoles.update( // Habilita el role de vendedor
						{StatusId:1}, 
						{where:{AccountId:rsFnShop['shopRequest']['Account'].id,RoleId:5}}
					).then(async function(rsRoleAccount){						
						var mailsend= await mail.sendEmail({ //envia notificación de correo
							"from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', 
							"to":rsFnShop['shopRequest']['Account'].email,
							"subject": '.:Tienda Pampatar '+ rsFnShop.name +' a sido Habilitada:.',
							"html":`<!doctype html>
							<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
							<hr style="width: 420; height: 1; background-color:#99999A;">
							<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
							<div  align="center">
								<h2 style="font-family:sans-serif; color:#ff4338;"> Tienda <b>` +  rsFnShop.name  + `</b> a sido reactivada</h2>
								<p style="font-family:sans-serif; font-size: 19px;" > El adminstrador de Pampatar habilitado nuevamente su tienda, si necesita más información debe comunicarse por correo eléctronico a la dirección:<b>  `+ process.env.EMAIL_INFO + `  </b>donde será atendido a la brevedad posible </p>	
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
							},{ transaction: t });
						if(mailsend){
							await t.commit();							
							res.json({"data":{"result":true,"Message":"La teineda  " + rsFnShop.name  +" a sido habilitada satisfactoriamente"}})
						}else{
							await t.rollback();
							console.log(error);
							res.json({data:{"result":false,"message":"Algo salió mal enviado correo de notificaión, intente nuevamente"}})
						}
					}).catch(async function(error){
						t.rollback();
						console.log(error);
						res.json({"data":{"result":false,"message":"Algo salió mal habilitando role, intente nuevamente"}})	
					})
					
				}).catch(async function(error){
					t.rollback();
					console.log(error);
					res.json({"data":{"result":false,"message":"Algo salió mal intentando procesar su petición, intente nuevamente"}})	
				})
		}).catch(async function(error){
			await t.rollback();
			console.log(error);
			res.json({data:{"result":false,"message":"Algo salió mal actializando estatus de contrato, intente nuevamente"}})
		})
		}else{
			res.json({"data":{"result":false,"message":"Tienda no existe o ya esta Habilitada"}})
		}
		
	}).catch(async function (error){
		await t.rollback();
		console.log(error);
		res.json({data:{"result":false,"message":"Algo salió mal actializando estatus de tienda, intente nuevamente"}})
	})
}
async function bidProcess(req,res){

	await model.bid.findAll({
		attributes:['id'],
		where:{
			id,shopId
		}
	});
}
async function bidInEvaluation(req,res){ // retorna la publicaciones en evaluación
	await model.Bids.findAll({		
		where:{
			
			/*[Op.not]:[{
				status:{					
					[Op.contains]:[
						{id:[2,3]},
					]
				}
			}],			
			status:{					
				[Op.contains]:[{id:1}]
			}
			*/

			status:{
				id:{[Op.any]:[{id:[2,3]}]
					}
				
				
			}
		}
	}).then(async function (rsBids){
		res.json(rsBids)
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retonando publicaciones"}})
	});
}

async function bidGetOne(req,res){ // retorna la publicaciones en evaluación
	const {id} =req.params
	await model.Bids.findAll({		
		where:{id}
	}).then(async function (rsBids){
		res.json(rsBids)
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retonando publicacion"}})
	});
}
async function bidApprove(req,res){
	const{
		id
	 }=req.body;
	  	today=new Date();
		y=today.getFullYear();
		mm=today.getMonth();
		d=today.getDay()
		h=today.getHours();
		m=today.getMinutes();
		s=today.getSeconds();
		var horaActual=y+'-'+mm+'-'+d+':'+h+':'+m+':'+s;	  
	
	const t = await model.sequelize.transaction();
	return await model.Bids.findOne({
		attributes:['id','title','status'],
		where:{id},
		include:[{
			model:model.shop,
			attributes:['id'],
			include:[{
					model:model.shopRequest,
					attributes:['id'],
					include:[{
							model:model.Account
						}
					]
				}
			]
		}
		]
	}).then(async function (rsBidsFind){
		
		
		//rsBidsFind.status.filter(d=>d.id.find(a=>a.includes('2')))
		var r= rsBidsFind.status.filter(st=>st.id==2).length;
		if(r==0){
			var newStatus=rsBidsFind.status.push({"id":2,"name":"Aprobada","date":horaActual});
			return await model.Bids.update({
				status:rsBidsFind.status},
				{where:{id}},
				{transaction:t}
			).then(async function (rsBids){
				//enviar email
				var mailsend= await mail.sendEmail({ //envia notificación de correo
					"from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', 
					"to":rsBidsFind['shop']['shopRequest']['Account'].email,
					"subject": '.:Hemos aprobado tu publicanción '+ rsBidsFind.id + ':.',
					"html":`<!doctype html>
					<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
					<hr style="width: 420; height: 1; background-color:#99999A;">
					<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
					<div  align="center">
						<h2 style="font-family:sans-serif; color:#ff4338;"> La publicación '<b>` +  rsBidsFind.title  + `</b>' ha sido aprobada</h2>
						<p style="font-family:sans-serif; font-size: 19px;" > El adminstrador de Pampatar aprobado su publicación ' ` + rsBidsFind.id  + ` ', si necesita más información debe comunicarse por correo eléctronico a la dirección:<b>  `+ process.env.EMAIL_INFO + `  </b>donde será atendido a la brevedad posible </p>	
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
					},{ transaction: t });
				if(mailsend){
					await t.commit();							
					res.json({"data":{"result":true,"Message":"La publicación  " + rsBidsFind.id  +" a sido aprobada satisfactoriamente"}})
				}else{
					await t.rollback();
					console.log(error);
					res.json({data:{"result":false,"message":"Algo salió mal enviado correo de notificaión, intente nuevamente"}})
				}
			}).catch(async function(error){
				console.log(error);		
				res.json({"data":{"result":false,"message":"Algo salió mal aprovando publicacion"}})
			});
		}else{
			t.rollback();
			res.json({"data":{"result":false,"message":"Publicacion aprobada"}})
		}
		
		
	}).catch(async function(error){
		console.log(error);		
		t.rollback();
		res.json({"data":{"result":false,"message":"Algo salió mal retonando publicacion"}})
	});
}
async function getAllBidByShop(req,res){
	const{shopId}=req.params
	
	try{
		const token = req.header('Authorization').replace('Bearer ', '')
		if(!token){
			res.json({"data":{"result":false, "message":"Token no valido"}});
			res.redireect(process.env.HOST_FRONT+'expired/error')
		}else {
			const shop=await generals.currentAccount(token);
			console.log(shop['data']['shop'].id);
			return await model.Bids.findAll({
				attributes:[
				'id',
				'skuId',
				'skuTypeId',
				'title',
				'photos',
				'category',
				'urlVideos',
				'materials',
				'customizable',
				'weight',
				'dimension',
				'customize',
				'status'],
				where: {
					shopId: shopId // de una tienda
				},
				include:[{
						model:model.disponibility,
						attributes:['id','name']
					},{
						model:model.skuType,
						attributes:['id','name']
					}
				]
			}).then(async function(rsBid){
				res.json(rsBid)
			}).catch(async function(error){
				console.log(error);
				res.json({"data":{"result":false,"message":"Algo salió mal retornando lista de publicaciones"}})
			})
		}
    }
    catch(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal obteniendo  publicaciones"}})
	}
};
module.exports={preShop,shopContract,getShopRequestInEvaluation,getShopRequestPreAproved,getContractByShop,
	getShopAll,getShopByName,getProfileShop,taxUpdate,getTaxCurrents,getTaxHistory,getShopRequestAll,
	editShopContract,getShopByContractStatus,shopDisable,shopEnable,bidProcess,bidInEvaluation,bidGetOne,
	bidApprove,getAllBidByShop};