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
						"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
						"to":rsShopRequest[0]['Account'].email,
						"subject": '.:TIENDA '+newStatus.name +':.',
						"html":`<!doctype html>
						<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
						<hr style="width: 420; height: 1; background-color:#99999A;">
						<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
					
						<div  align="center">
							<h2 style="font-family:sans-serif; color:#ff4338;">Pampatar</h2>
							<p style="font-family:sans-serif; font-size: 19px;" > ¡Tu solicitud de tienda en Pampatar ha sido <b>`+ newStatus.name +`</b>!</p> <br>
							<p> “El equipo de Pampatar.cl se pondrá en contacto con ud. para definir los acuerdos comerciales y finalmente activar su cuenta.
							Si desea comuniquese con nosotros a `+process.env.EMAIL_INFO+` </p>						
							<a href="`+process.env.HOST_FRONT+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Ir a Pampatar.cl"></a>
							<p style="font-family:sans-serif; color: #99999A; margin-top: 25px" class="card-text">¿ESTE NO ERES TÚ? COMUNICATE CON NOSOTROS</p>
						</div>
							<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
							<br>
							<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
								<p align="center">
									<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
								</p>
						
								<p  align="center" >
								info@pampatar.cl
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
					return await model.attachment.create({data:attachment.data,attachmentTypeId:5,tags:attachment.tags},{transaction:t})
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
											var content="Hemos aprobado tu tienda', ¡ya puedes comenzar a vender tus productos!, “si tienes dudas al configurar tu cuenta, contacta con tu ejecutivo o escríbenos al correo";
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
													<p style="font-family:sans-serif; font-size: 19px;" > `+ content +`  `+ process.env.EMAIL_ADMIN+`</p>						
													`+ btn +`
													<p style="font-family:sans-serif; color: #99999A; margin-top: 25px" class="card-text">¿ESTE NO ERES TÚ? COMUNICATE CON NOSOTROS</p>
												</div>						
												<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
												<br>
												<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
													<p align="center">	
														<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
													</p>					
											
													<p  align="center" >
													info@pampatar.cl
															Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
													</p>
												</div>`
												},{ transaction: t });
											if(mailsend){
												await t.commit();
												res.json({data:{"result":true,"message":"Contrato para la tienda "+ rsShop.name +" fue registrado satisfactoriamente"}})
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
		res.json({rsShopRequestByStatus})
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
		if(rsShopRequestByStatus.length>0){
			res.json({rsShopRequestByStatus})
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
				attributes:['data','tags','attachmentTypeId'],
				require:true
			},{
				model:model.Status, as:'status' ,
				attributes:['id','name'],
				require:true
			}
		]
	})
	.then(async function(rsShopContract){
		console.log(rsShopContract['Status']);
		res.json({"data":{"result":true,rsShopContract}})

	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal buscando contrato de la tienda"}})
	})
}
async function getShopAll (req,res){	
	return await model.shop.findAll({attributes:['id','name','phone','partner','address','processId','createdAt','startActivityAttachment','storeType','logo'],

		include:[{
				model:model.shopRequest,
				attributes:['id'],
				require:true,
				include:[
					{
						model:model.Account,
						attributes:['id','email'],
						where:{statusId:1},
						require:true,
						include:[{
							model:model.accountRoles,
							attributes:['id'],
							require:true,
							include:[{
								model:model.Status,
								attributes:['id','name']
							}],
							where:{RoleId:5}
						}]
					}
				]
			}
		]
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
			model:model.shopRequest,
			attributes:['id'],
			require:true,
			include:[
				{
					model:model.Account,
					attributes:['id','email'],
					where:{statusId:1},
					require:true,
					include:[{
						model:model.accountRoles,
						attributes:['id'],
						require:true,
						include:[{
							model:model.Status,
							attributes:['id','name']
						}],
						where:{RoleId:5}
					}]
				}
			]
		}
	]
	}).then(async function(rsShopName){
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
			},{
				model:model.Status,as:'status',
				attributes:['id','name']
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
									<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
								</p>					
						
								<p  align="center" >
								info@pampatar.cl
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
									<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
								</p>					
						
								<p  align="center" >
								info@pampatar.cl
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

async function bidInEvaluation(req,res){ // retorna la publicaciones en evaluación
	
	await model.shop.findAll({
		attributes:['id','name','logo'],
		include:[{
				model:model.Bids,
				attributes:['id','title','updatedAt','status'],
				where:{StatusId:1},
				required:true
			}
		],
		where:{statusId:1}
	})
	.then(async function(rsShops){
		//inEval= rsShops.status[rsShops.status.length].find(status=>rsShops.status[rsShops.status.length].id=1);
		var rsInEval=[];
		for (i = 0; i < rsShops.length; i++) { //recorre tiendas			
			for (y = 0; y < rsShops[i]['Bids'].length; y++) { // recorre publicaciones de una tienda
				if(rsShops[i]['Bids'][y].status[rsShops[i]['Bids'][y].status.length-1].id==1){					
					rsInEval.push(rsShops[i]['Bids'][y]);
				}
			}
		}
		res.json(rsInEval)
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retornando publicaciones"}})
	})


	/*await model.Bids.findAll({
		attributes:['id','title','updatedAt'],
		where:{statusProcessId:1},
		include:[{
				model:model.shop,
				attributes:['id','name']
			}
		]
	}).then(async function (rsBids){
		res.json(rsBids)
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retonando publicaciones"}})
	});*/
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
		where:{id,StatusId:2},
		include:[{
			model:model.shop,
			attributes:['id'],
			required:true,
			include:[{
					model:model.shopRequest,
					attributes:['id'],
					required:true,
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
		if(rsBidsFind){
			//var r= rsBidsFind.status.filter(st=>st.id==2).length;		
			var newStatus=rsBidsFind.status.push({"id":6,"name":"Creación de Publicación Aprobada","date":horaActual});
			return await model.Bids.update({ // Aprueba tienda Estatus 6 
				status:rsBidsFind.status,StatusId:1},
				{where:{id}},
				{transaction:t}
			).then(async function (rsBids){
				//enviar email
				var mailsend= await mail.sendEmail({ //envia notificación de correo
					"from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', 
					"to":rsBidsFind['shop']['shopRequest']['Account'].email,
					"subject": '.:Hemos aprobado tu publicanción #'+ rsBidsFind.id + ':.',
					"html":`<!doctype html>
					<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
					<hr style="width: 420; height: 1; background-color:#99999A;">
					<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
					<div  align="center">
						<h2 style="font-family:sans-serif; color:#ff4338;"> La publicación '<b>` +  rsBidsFind.title  + `</b>' ha sido <b>aprobada</b> </h2>
						<p style="font-family:sans-serif; font-size: 19px;" > El adminstrador de Pampatar ha <b>aprobada</b su publicación con el código <b> ` + rsBidsFind.id  + ` </b>, si necesita más información debe comunicarse por correo eléctronico a la dirección:<b>  `+ process.env.EMAIL_INFO + `  </b>donde será atendido a la brevedad posible </p>	
						<p style="font-family:sans-serif; color: #99999A; margin-top: 25px" class="card-text">¿ESTE NO ERES TÚ? COMUNICATE CON NOSOTROS</p>
					</div>
					<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
					<br>
					<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
						<p align="center">	
							<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
						</p>					
				
						<p  align="center" >
						info@pampatar.cl
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
				await t.rollback();
				console.log(error);		
				res.json({"data":{"result":false,"message":"Algo salió mal aprobando publicacion"}})
			});
		}else{
			t.rollback();
			res.json({"data":{"result":false,"message":"Publicacion procesada anteriormente"}})
		}
		
		
	}).catch(async function(error){
		console.log(error);		
		t.rollback();
		res.json({"data":{"result":false,"message":"Algo salió mal retonando publicacion"}})
	});
}
async function bidReject(req,res){
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
		where:{id,StatusId:1},
		include:[{
			model:model.shop,
			attributes:['id'],
			required:true,
			include:[{
					model:model.shopRequest,
					attributes:['id'],
					required:true,
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
		if(rsBidsFind){
			//var r= rsBidsFind.status.filter(st=>st.id==2).length;		
			var newStatus=rsBidsFind.status.push({"id":7,"name":"Creación de Publicación Rechazada","date":horaActual});
			return await model.Bids.update({
				status:rsBidsFind.status,StatusId:2},
				{where:{id}},
				{transaction:t}
			).then(async function (rsBids){
				//enviar email
				var mailsend= await mail.sendEmail({ //envia notificación de correo
					"from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', 
					"to":rsBidsFind['shop']['shopRequest']['Account'].email,
					"subject": '.:Hemos rechazado tu publicanción #'+ rsBidsFind.id + ':.',
					"html":`<!doctype html>
					<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
					<hr style="width: 420; height: 1; background-color:#99999A;">
					<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
					<div  align="center">
						<h2 style="font-family:sans-serif; color:#ff4338;"> La publicación '<b>` +  rsBidsFind.title  + `</b>' ha sido <b>rechazada</b></h2>
						<p style="font-family:sans-serif; font-size: 19px;" > El adminstrador de Pampatar ha <b>rechazado</b> su publicación con el código <b> ` + rsBidsFind.id  + ` </b>, si necesita más información debe comunicarse por correo eléctronico a la dirección:<b>  `+ process.env.EMAIL_INFO + `  </b>donde será atendido a la brevedad posible </p>	
						<p style="font-family:sans-serif; color: #99999A; margin-top: 25px" class="card-text">¿ESTE NO ERES TÚ? COMUNICATE CON NOSOTROS</p>
					</div>
					<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
					<br>
					<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
						<p align="center">	
							<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
						</p>					
				
						<p  align="center" >
						info@pampatar.cl
								Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
						</p>
					</div>`
					},{ transaction: t });
				if(mailsend){
					await t.commit();							
					res.json({"data":{"result":true,"Message":"La publicación  " + rsBidsFind.id  +" a sido rechazada satisfactoriamente"}})
				}else{
					await t.rollback();
					console.log(error);
					res.json({data:{"result":false,"message":"Algo salió mal enviado correo de notificaión, intente nuevamente"}})
				}
			}).catch(async function(error){
				await t.rollback();
				console.log(error);		
				res.json({"data":{"result":false,"message":"Algo salió mal rechazando publicacion"}})
			});
		}else{
			t.rollback();
			res.json({"data":{"result":false,"message":"Publicacion procesada anteriormente"}})
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
				'status',
				'StatusId'],
				where: {
					shopId: shopId // de una tienda
				},
				include:[{
						model:model.disponibility,
						attributes:['id','name']
					},{
						model:model.skuType,
						attributes:['id','name']
					},{
						model:model.Status,
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
}
async function getBidUpdateRequestReject (req,res){ // Rechaza una solicitud de actualización de publicación
	const {shopId,bidId}=req.params;
	if(shopId>0,bidId>0){ //Valida datos de entrada
		const t = await model.sequelize.transaction();
		return await model.bidUpdateRequest.findOne({ // Valida que la solicitud de modidicación este en evaluación y la publicación este activa
			where:{shopId,BidId:bidId,statusProcessId:8},
			include:[{
				model:model.Bids,
				attributes:['id','StatusId','skuTypeId','status','title'],
				include:[{
					model:model.shop,
					attributes:['id'],
					include:[{
						model:model.shopRequest,
						attributes:['id'],
						include:[{
							model:model.Account
						}]
					}]
				}]
			}],
			transaction:t
		}).then(async function(rsBidUpdateRequest){
			var today=new Date();
			if(rsBidUpdateRequest){
				rsBidUpdateRequest['Bid'].status.push({"id":9,"name":"Modificación de Publicación en Rechazada","date":today});
				return await model.bidUpdateRequest.update({statusProcessId:9},{where:{id:rsBidUpdateRequest.id}},{transaction:t})
				.then(async function(rsBidUpdateRequestUd){
					var link=process.env.HOST_ADMIN+'bidsSellerUpdate/';
					var mailsendShoper= mail.sendEmail({
					"from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', 
					"to":rsBidUpdateRequest['Bid']['shop']['shopRequest']['Account'].email,
					"subject": 'Actualiación Rechazada',
					"html": `<!doctype html>
					<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
					<hr style="width: 420; height: 1; background-color:#99999A;">
					<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
				
					<div  align="center">
						<h2 style="font-family:sans-serif; color:#ff4338;" >¡Actualización no cumple con los criterios !</h2>
						<p style="font-family:sans-serif; font-size: 19px;" >El administrador rechazó solicitud de actualización de la publicación <b>`+ rsBidUpdateRequest['Bid'].title+`(`+rsBidUpdateRequest['Bid'].id+`)` +`</b> por inclumplimiento de los terminso y condiciones de pampatar.cl</p>
					
					<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Modificar nuevamente"></a>
					</div>
					<br><br><br>
						<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
						<br>
						<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
							<p align="center">	
								<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
							</p>					
					
							<p  align="center" >
							info@pampatar.cl
									Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
							</p>
						</div>`
					},{ transaction: t })							
					
					if(mailsendShoper)	{
						await t.commit();
						res.json({"data":{"result":true,"message":"Publicación Rechazada satisfactorimente"}})										
					}else{
						await t.rollback();
						console.log(error);
						res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
					}
				}).catch(async function(error){
					t.rollback();
					console.log(error);
					res.json({"data":{"result":false,"message":"Algo salió mal actualizando estatus de solucitd de actualización, intente nuevamente"}})
				});			
			}else{
				t.rollback();
				res.json({"data":{"result":false,"message":"Publicación no esta pendiente para esta tienda"}})
			}
			
		}).catch(async function(error){
			console.log(error);
			res.json({"data":{"result":false,"message":"Algo salió mal validando solititud de actualización"}})
		})
	}else{
		res.json({"data":{"result":false,"message":"Verifique parametros de entrada"}})
	}
}
async function getBidUpdateRequestApproved (req,res){ // bid update request Approvate
	const {shopId,bidId}=req.params;
	if(shopId>0,bidId>0){ //Valida datos de entrada
		const t = await model.sequelize.transaction();
		return await model.bidUpdateRequest.findOne({ // Valida que la solicitud de modidicación este en evaluación y la publicación este activa
			where:{shopId,BidId:bidId,statusProcessId:8},
			include:[{
				model:model.Bids,
				attributes:['id','StatusId','skuTypeId','status','title'],
				include:[{
					model:model.shop,
					attributes:['id'],
					include:[{
						model:model.shopRequest,
						attributes:['id'],
						include:[{
							model:model.Account
						}]
					}]
				}]
			}],
			transaction:t
		}).then(async function(rsBidUpdateRequest){
			if(rsBidUpdateRequest){ //si encontro algun registro
				today=new Date();				
				if(rsBidUpdateRequest['Bid'].StatusId==1){ // Si la publiación esta activa
					var today=new Date();
					rsBidUpdateRequest['Bid'].status.push({"id":10,"name":"Modificación de Publicación en Aprobada","date":today});
					const change=rsBidUpdateRequest.change
					switch (rsBidUpdateRequest['Bid'].skuTypeId){// servicio
						case 3: // publicación de Servicio 				
							//:: VALIDA CAMPOS DEL SERVICIO  ::
							
							if(change.photos!=null &&  change.title.replace(/ /g, "").length>0 && change.category!=null && change.longDesc.replace(/ /g, "").length>0 &&
								change.smallDesc.replace(/ /g, "").length>0 && change.disponibilityId>0 && change.tags!=null && change.devolution!=null && change.garanty!=null &&
								change.materials!=null && change.skuId>0 ){						
								catDefault={cat1s:{"id":2,"name":"Talleres",subCat:change.category}};// asigna categoría pertinente
								return await generals.skuInInventoryById({bidType:'service',shopId,skuId:change.skuId},{transaction:t}) // valida que el SKU este inventariado 
								.then(async function(rsSkuInStock){	
									console.log(rsSkuInStock);					
									if(rsSkuInStock){
										return await generals.ShopStatusGeneral({shopId},{transaction:t}) // valida estatus de una tienda
										.then(async function (rsShopStatus){
											if(rsShopStatus){
												// Adjunta fotos
												var photosAttached=[];
												for (var i = 0; i < change.photos.length; i++){
													await model.attachment.create({data:change.photos[i].data,attachmentTypeId:change.photos[i].attachmentTypeId,tags:{"shop":shopId,skuId:change.skuId,"uso":"publicacion","tipoPublicaion":"Taller","category":catDefault}},{transaction:t})
													.then(async function(rsAttach){
														photosAttached.push({"id":rsAttach.id,"type":rsAttach.attachmentTypeId})
													}).catch(async function(error){
														t.rollback();
														console.log(error);
														res.json({"data":{"result":false,"message":"Algo salió mal adjuntando fotos, intente nuevamente"}})
													});
												}
												return await model.Bids.update({photos:photosAttached,urlVideos:change.urlVideos,title:change.title,
																				category:catDefault,longDesc:change.longDesc,smallDesc:change.smallDesc,
																				disponibilityId:change.disponibilityId,tags:change.tags,devolution:change.devolution,
																				garanty:change.garanty,materials:change.materilas,BrandId:change.BrandId,
																				skuId:change.skuId,shopId,status:rsBidUpdateRequest['Bid'].status,time:change.time},																				
																				{where:{id:bidId},
																				transaction:t},
																			)
												.then(async function(rsBid){
													return await model.bidUpdateRequest.update({statusProcessId:10},{where:{id:rsBidUpdateRequest.id}},{transaction:t})
													.then(async function(rsBidUpdateRequestUd){
														//console.log(rsBidUpdateRequest['Bid']);
														var link=process.env.HOST_FRONT+'publicacion/'+rsBidUpdateRequest['Bid'].id;
														var mailsendShoper= mail.sendEmail({
														"from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', 
														"to":rsBidUpdateRequest['Bid']['shop']['shopRequest']['Account'].email,
														"subject": 'Publicación Pampatar Actualizada',
														"html": `<!doctype html>
														<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
														<hr style="width: 420; height: 1; background-color:#99999A;">
														<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
													
														<div  align="center">
															<h2 style="font-family:sans-serif; color:#ff4338;" >¡Su publicación ha sido actualizada!</h2>
															<p style="font-family:sans-serif; font-size: 19px;" >Su publicaicón <b>`+ change.title +`</b>se actualizó</p>
														
														<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Ver Publicación"></a>
														</div>
														<br><br><br>
															<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
															<br>
															<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
																<p align="center">	
																	<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
																</p>					
														
																<p  align="center" >
																info@pampatar.cl
																		Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
																</p>
															</div>`
														},{ transaction: t })							
														
														if(mailsendShoper)	{
															await t.commit();
															res.json({"data":{"result":true,"message":"Publicación Actualizada satisfactorimente"}})										
														}else{
															await t.rollback()
															res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
														}
													}).catch(async function(error){
														t.rollback();
														console.log(error);
														res.json({"data":{"result":false,"message":"Algo salió mal actualizando estatus de solucitd de actualización, intente nuevamente"}})
													});
												}).catch(async function (error){
													t.rollback();
													console.log(error);
													if(error.name=='SequelizeUniqueConstraintError'){
														res.json({"data":{"result":false,"message":"Tienda poseé otra publicación con este título "}})
													}else if(error.name=="SequelizeValidationError"){
														res.json({ "data":{"result":false,"message":"Verifique valores del formulario"}	});												
													}else{
														console.log(error);
														res.json({"data":{"result":false,"message":"Algo salió mal actualizando publicación, intente nuevamente"}})
													}
												})
											}else{
												t.rollback();
												res.json ({"data":{"result":false,"message":"Su tienda esta inactiva"}})
											}
										}).catch(async function (error){
											console.log(error);
											t.rollback();
											res.json({"data":{"result":false,"message":"Algo salió mal validando estatus de su tienda"}})
										})
									}else{
										t.rollback();
										res.json ({"data":{"result":false,"message":"El nuevo taller esta sin inventario disponible, debe reponer inventario para este taller"}})
									}
									
								}).catch(async function (error){
									t.rollback();
									console.log(error);
									res.json({"data":{"result":false,"message":"Algo salió mal validando estatus del producto"}})
								})
							}else{
								t.rollback();
								res.json({"data":{"result":false,"message":"Faltan valores en el formulario"}})
							}
						break;
						case 2: // publicación de Materiales / Suministros					
							//:: VALIDA CAMPOS DE MATERIALES Y SUMINISTROS  ::
							if(change.photos!=null &&  change.title.replace(/ /g, "").length>0 && change.category!=null && change.longDesc.replace(/ /g, "").length>0 &&
							change.smallDesc.replace(/ /g, "").length>0 && change.disponibilityId>0 && change.tags!=null && change.devolution!=null && change.garanty!=null &&
							change.materials!=null && change.skuId>0 && change.category!=null && change.weight!=null && change.include!=null && change.dimension!=null){						
								catDefault={cat1s:{"id":4,"name":"Materiales",subCat:change.category}};// asigna categoría pertinente
								return await generals.skuInInventoryById({bidType:'prodcut',shopId,skuId:change.skuId},{transaction:t}) // valida que el SKU este inventariado 
								.then(async function(rsSkuInStock){
									//console.log(rsSkuInStock);
									if(rsSkuInStock){
										return await generals.ShopStatusGeneral({shopId},{transaction:t}) // valida estatus de una tienda
										.then(async function (rsShopStatus){
											//console.log(rsShopStatus);
											if(rsShopStatus){
												// Adjunta fotos
												var photosAttached=[];
												for (var i = 0; i < change.photos.length; i++){
													await model.attachment.create({data:change.photos[i].data,attachmentTypeId:change.photos[i].attachmentTypeId,tags:{"shop":shopId,skuId:change.skuId,"uso":"publicacion","tipoPublicaion":"Material / Siministro",category:change.category}},{transaction:t})
													.then(async function(rsAttach){
														//photosAttached.push(rsAttach.id)
														photosAttached.push({"id":rsAttach.id,"type":rsAttach.attachmentTypeId})
													}).catch(async function(error){
														t.rollback();
														console.log(error);
														res.json({"data":{"result":false,"message":"Algo salió mal adjuntando fotos, intente nuevamente"}})
													});
												}
												return await model.Bids.update({photos:photosAttached,urlVideos:change.urlVideos,title:change.title,
													category:catDefault,longDesc:change.longDesc,smallDesc:change.smallDesc,disponibilityId:change.disponibilityId,
														tags:change.tags,devolution:change.devolution,garanty:change.garanty,materials:change.materials,BrandId:change.BrandId,
														skuId:change.skuId,shopId,time:change.time,weight:change.weight,dimension:change.dimesion,reasons:change.reasons,
														customizable:change.customizable,customize:change.customize,status:rsBidUpdateRequest['Bid'].status},
														{where:{id:bidId},
														transaction:t})
												.then(async function(rsBid){
													return await model.bidUpdateRequest.update({statusProcessId:10},{where:{id:rsBidUpdateRequest.id}},{transaction:t})
													.then(async function(rsBidUpdateRequestUd){
														var link=process.env.HOST_FRONT+'publicacion/'+rsBidUpdateRequest['Bid'].id;
														var mailsendShoper= mail.sendEmail({
														"from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', 
														"to":rsBidUpdateRequest['Bid']['shop']['shopRequest']['Account'].email,
														"subject": 'Publicación Pampatar Actualizada',
														"html": `<!doctype html>
														<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
														<hr style="width: 420; height: 1; background-color:#99999A;">
														<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
													
														<div  align="center">
															<h2 style="font-family:sans-serif; color:#ff4338;" >¡Su publicación ha sido actualizada!</h2>
															<p style="font-family:sans-serif; font-size: 19px;" >Su publicaicón <b>`+ change.title +`</b>se actualizó</p>
														
														<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Ver Publicación"></a>
														</div>
														<br><br><br>
															<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
															<br>
															<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
																<p align="center">	
																	<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
																</p>					
														
																<p  align="center" >
																info@pampatar.cl
																		Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
																</p>
															</div>`
														},{ transaction: t })							
														
														if(mailsendShoper)	{
															await t.commit();
															res.json({"data":{"result":true,"message":"Publicación Actualizada satisfactorimente"}})										
														}else{
															await t.rollback()
															res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
														}
													}).catch(async function(error){
														t.rollback();
														console.log(error);
														res.json({"data":{"result":false,"message":"Algo salió mal actualizando estatus de solucitd de actualización, intente nuevamente"}})
													});
			
												}).catch(async function (error){
													t.rollback();
													console.log(error);
													if(error.name=='SequelizeUniqueConstraintError'){
														res.json({"data":{"result":false,"message":"Tienda poseé otra publicación con este título "}})
													}else if(error.name=="SequelizeValidationError"){
														res.json({ "data":{"result":false,"message":"Verifique valores del formulario"}	});												
													}else{
														console.log(error);
														res.json({"data":{"result":false,"message":"Algo salió mal creando publicación, intente nuevamente"}})
													}
												})
											}else{
												t.rollback();
												return {"data":{"result":false,"message":"Su tienda esta inactiva"}}
											}
										}).catch(async function (error){
											console.log(error);
											t.rollback();
											res.json({"data":{"result":false,"message":"Algo salió mal validando estatus de su tienda"}})
										})
									}else{
										t.rollback();
										return {"data":{"result":false,"message":"Product / servicio sin inventario disponible"}}
									}
									
								}).catch(async function (error){
									t.rollback();
									console.log(error);
									res.json({"data":{"result":false,"message":"Algo salió mal validando estatus del producto"}})
								})
							}else{
								t.rollback();
								res.json({"data":{"result":false,"message":"Faltan valores en el formulario Producto"}})
							}
						break; 
						case 1: // publicación de Producto Hechos a Mano				
							//:: VALIDA CAMPOS DEL PRODUCTO HECHO A MANO  ::
							if(change.photos!=null &&  change.title.replace(/ /g, "").length>0 && change.category!=null && change.longDesc.replace(/ /g, "").length>200 &&
								change.smallDesc.replace(/ /g, "").length>20 && change.disponibilityId>0 && change.tags!=null && change.devolution!=null && change.garanty!=null &&
								change.materials!=null && change.skuId>0  && change.time!=null && change.weight!=null && change.include!=null && change.customizable!=null 
								&& change.customize!=null && change.reasons!=null && change.dimension!=null){
								catDefault={cat1s:{"id":1,"name":"Hecho a mano",subCat:change.category}};// asigna categoría pertinente
								return await generals.skuInInventoryById({bidType:'prodcut',shopId,skuId:change.skuId},{transaction:t}) // valida que el SKU este inventariado 
								.then(async function(rsSkuInStock){
									//console.log(rsSkuInStock);
									if(rsSkuInStock){
										return await generals.ShopStatusGeneral({shopId},{transaction:t}) // valida estatus de una tienda
										.then(async function (rsShopStatus){
											//console.log(rsShopStatus);
											if(rsShopStatus){
												// Adjunta fotos
												var photosAttached=[];
												for (var i = 0; i < change.photos.length; i++){
													await model.attachment.create({data:change.photos[i].data,attachmentTypeId:change.photos[i].attachmentTypeId,tags:{"shop":shopId,skuId:change.skuId,"uso":"publicacion","tipoPublicaion":"PHM",category:change.category,reasons:change.reasons}},{transaction:t})
													.then(async function(rsAttach){
														//photosAttached.push(rsAttach.id)
														photosAttached.push({"id":rsAttach.id,"type":rsAttach.attachmentTypeId})
													}).catch(async function(error){
														t.rollback();
														console.log(error);
														res.json({"data":{"result":false,"message":"Algo salió mal adjuntando fotos, intente nuevamente"}})
													});
												}
												return await model.Bids.update({photos:photosAttached,urlVideos:change.urlVideos,title:change.title,category:catDefault,
														longDesc:change.longDesc,smallDesc:change.smallDesc,disponibilityId:change.disponibilityId,tags:change.tags,
														devolution:change.devolution,garanty:change.garanty,materials:change.materials,BrandId:change.BrandId,
														skuId:change.skuId,shopId:shopId,time:change.time,weight:change.weight,dimension:change.dimension,
														reasons:change.reasons,customizable:change.customizable,customize:change.customize,status:rsBidUpdateRequest['Bid'].status,
														variations:change.variations},
														{where:{id:bidId},
														transaction:t})
												.then(async function(rsBid){
													return await model.bidUpdateRequest.update({statusProcessId:10},{where:{id:rsBidUpdateRequest.id},transaction:t})
													.then(async function(rsBidUpdateRequestUd){														
														var link=process.env.HOST_FRONT+'publicacion/'+rsBidUpdateRequest['Bid'].id;
														var mailsendShoper= mail.sendEmail({
														"from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', 
														"to":rsBidUpdateRequest['Bid']['shop']['shopRequest']['Account'].email,
														"subject": 'Publicación Pampatar Actualizada',
														"html": `<!doctype html>
														<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
														<hr style="width: 420; height: 1; background-color:#99999A;">
														<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
													
														<div  align="center">
															<h2 style="font-family:sans-serif; color:#ff4338;" >¡Su publicación ha sido actualizada!</h2>
															<p style="font-family:sans-serif; font-size: 19px;" >Su publicaicón <b>`+ change.title +`</b>se actualizó</p>
														
														<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Ver Publicación"></a>
														</div>
														<br><br><br>
															<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
															<br>
															<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
																<p align="center">	
																	<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
																</p>					
														
																<p  align="center" >
																info@pampatar.cl
																		Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
																</p>
															</div>`
														},{ transaction: t })
														if(mailsendShoper)	{
															await t.commit();
															res.json({"data":{"result":true,"message":"Publicación Actualizada satisfactorimente"}})										
														}else{
															await t.rollback()
															res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
														}
													}).catch(async function (error){
														t.rollback();
														res.json({"data":{"result":false,"message":"Algo salio mal actualizado estatus de solicitud de modificación "}})
													})
												}).catch(async function (error){
													t.rollback();
													if(error.name=='SequelizeUniqueConstraintError'){
														res.json({"data":{"result":false,"message":"Tienda posee otra publicación con este título "}})
													}else if(error.name=="SequelizeValidationError"){
														console.log(error);
														res.json({ "data":{"result":false,"message":"Verifique valores del formulario"}	});												
													}else{
														console.log(error);
														res.json({"data":{"result":false,"message":"Algo salió mal creando publicación, intente nuevamente"}})
													}
												})
											}else{
												t.rollback();
												return {"data":{"result":false,"message":"Su tienda esta inactiva"}}
											}
										}).catch(async function (error){
											t.rollback();
											res.json({"data":{"result":false,"message":"Algo salió mal validando estatus de su tienda"}})
										})
									}else{
										t.rollback();
										return {"data":{"result":false,"message":"Product / servicio sin inventario disponible"}}
									}
								}).catch(async function (error){
									t.rollback();
									res.json({"data":{"result":false,"message":"Algo salió mal validando estatus del producto"}})
								})
							}else{
								t.rollback();
								res.json({"data":{"result":false,"message":"Faltan valores en el formulario Producto"}})
							}
						break;
					}
				}else{
					t.rollback();
					res.json({"data":{"result":false,"message":"Publicación esta inactiva y no puede ser modificada"}})
				}
			}else{
				t.rollback();
				res.json({"data":{"result":false,"message":"Publicación no esta pendiente para esta tienda"}})
			}
		}).catch(async function(error){
			console.log(error);
			res.json({"data":{"result":false,"message":"Algo salió mal validando solititud de actualización"}})
		})
	}else{
		res.json({"data":{"result":false,"message":"Verifique parametros de entrada"}})
	}
}
async function bidRevoke(req,res){
	const{bidId} = req.params; 
	await model.Bids.update({StatusId:2},{where:{id:bidId}})
	.then(async function(rsBidUpdate){
		res.json({"data":{"result":true,"message":"Publicación dada de baja satisfactoriamente"}})
	}).catch(async function(error){
		res.json({"data":{"result":false,"message":"Algo salió mal dando de baja publicación"}})
	})
}
async function bidActivate(req,res){
	const{bidId} = req.params
	return await model.Bids.findOne({
		attributes:['id'],
		where:{id:bidId},
		include:[{
			model:model.shop,
			include:[{
				model:model.shopRequest,
				include:[{
					model:model.Account,
					include:[{
						model:model.accountRoles,
						where:{StatusId:1}

					}]
				}]
			}]
		}]
	}).then(async function(rsBidsFind){
		await model.Bids.update({StatusId:1},{where:{id:bidId}})
		.then(async function(rsBidUpdate){
			res.json({"data":{"result":true,"message":"Publicación activada satisfactoriamente"}})
		}).catch(async function(error){
			res.json({"data":{"result":false,"message":"Algo salió mal activando publicación"}})
		})
	}).catch(async function(error){
		res.json({"data":{"result":false,"message":"Algo salió mal validando publicación"}})
	})
}
async function getBidUpdateRequestList(req,res){
	return await model.shop.findAll({
		attributes:['id','name','logo'],
		include:[{
				model:model.Bids,
				where:{	StatusId:1},
				include:[{
					model:model.bidUpdateRequest,
					where:{statusProcessId:8}
				},{
					model:model.skuType
				},{
					model:model.Brands,
					attributes:['id','name']
				},{
					model:model.disponibility,
					attributes:['id','name']
				}
			]
			}
		]
	}).then(async function(rsBidUpdateRequestLis){
		res.json(rsBidUpdateRequestLis);
	}).catch(async function(error){
		console.log(error)
		res.json({"data":{"result":false,"message":"Algo salió mal listando solicitides de modificación"}})
	})
}
async function getImgById(req,res){
	const{imgId}=req.params
	if(imgId>0){
		await model.attachment.findOne({
			attributes:['id','data'],
			where:{id:imgId},
			include:[{
				model:model.attachmenType, as:'attachmentType',
				attributes:['id','name']
			}]
		}).then(async function(rsAttachmen){
			if(rsAttachmen){
				res.json(rsAttachmen);
			}else{
				res.json({"data":{"result":false,"message":"Imagen no existe"}})
			}
		}).catch(async function(error){
			console.log(error);
			res.json({"data":{"result":false,"message":"Algo salio mal retornando archivo, intente nuevamente"}})
		})
	}else{
		res.json({"data":{"result":false,"message":"Debe indicar la imagen a buscar"}})
	}
}
async function bidActiveAdmin(req,res){ // Activa una publicación
	const{bidId,shopId}=req.params;	
	return await model.Bids.findOne({ //valida la existencia de la publicación
	  attributes:['id','title','skuTypeId','skuId','StatusId','status'],
	  where:{id:bidId,shopId},
	  include:[{
		  model:model.shop,
		  attributes:['id'],
		  required:true,
		  include:[{
			model:model.shopRequest,
			attributes:['id'],
			required:true,
			include:[{
			  model:model.Account,
			  required:true,
			  attributes:{exclude:['createdAt','updatedAt']}
		  }]
			
		}]
		  
	  }]
	}).then(async function(rsBidFind){
		today=new Date();		
	  if(rsBidFind!=null){
		//valida si hay existencia inventario
	   var type;
		if(rsBidFind.skuTypeId==3){
		  type='service';
		}else if(rsBidFind.skuTypeId==2){
		  type='product';
		}else if(rsBidFind.skuTypeId==1){
		  type='product';
		}
		var rsStock = await generals.stockMonitorGeneral({"productId":rsBidFind.skuId,type,"shopId":rsBidFind['shop'].id}); // Valida existencia  
		if(rsStock['data'].total>0){
		  if(rsBidFind.StatusId==3 || rsBidFind.StatusId==2) {// Si esta inactiva
			rsBidFind.status.push({"id":1,"name":"Activada","date":today})
			const t = await model.sequelize.transaction();		//Inicia transaccion 
			return await model.Bids.update({ // activa publicación
			  StatusId:1,status:rsBidFind.status},
			{where:{id:bidId}, transaction:t}
			).then(async function(rsBidUpdate){            
			  //Envia notificación vía Email
			  mail.sendEmail({
				"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', // Enviar correo
				"to":rsBidFind['shop']['shopRequest']['Account'].email,
				"subject": 'Publicación Pampatar #'+ rsBidFind.id+' activada',
				"html":`<!doctype html>
				<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
				<hr style="width: 420; height: 1; background-color:#99999A;">
				<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
			  
				<div  align="center">
				  <h2 style="font-family:sans-serif; color:#ff4338;" >Pampatar ha activado su publicación!</h2>
				  <p style="font-family:sans-serif; font-size: 19px;" > EL adminstrador de pampatar.cl activado la publicación <b> `+ rsBidFind.title +`</b>, puede visualizar en el sistema </p>
								
				</div>
				<br><br><br>
				  <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
				  <br>
				  <div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
					<p align="center">	
					  <a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
					</p>					
				
					<p  align="center" >
					info@pampatar.cl
						Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
					</p>
				  </div>`
				  
				});
				t.commit(); // confirma el registro
				res.json({"data":{"result":true,"message":"Publicación activada satisfactoriamente"}})
			}).catch(async function(error){
			  console.log(error);
			  t.rollback();
			  res.json({"data":false,"message":"Algo salio mal activando publicación"})
			})
		  }else{
			res.json({"data":{"result":false,"message":"Esta publicación a sido activada anteriormente"}})
		  }
		}else{
		  res.json({"data":{"result":false,"message":"Debe aumentar el Stock para activar su publicación"}})
		}
  
	  }else{
		res.json({"data":{"result":false,"message":"Publicación no registrada"}})
	  }
	})
  }
  async function bidRejectAdmin(req,res){ // Inactiva (de baja) una publicación
	const{bidId,shopId}=req.params;
	
	return await model.Bids.findOne({ //valida la existencia de la publicación
	  attributes:['id','title','skuTypeId','skuId','StatusId','status'],
	  where:{id:bidId,shopId},
	  include:[{
		  model:model.shop,
		  attributes:['id'],
		  include:[{
			model:model.shopRequest,
			attributes:['id'],
			include:[{
			  model:model.Account,
			  attributes:{exclude:['createdAt','updatedAt']}
		  }]
			
		}]
		  
	  }]
	}).then(async function(rsBidFind){
	  today=new Date();
	  if(rsBidFind!=null){
		//valida si hay existencia inventario
		rsBidFind.status.push({"id":3,"name":"Inhabilitada por Pampatar","date":today})
		if(rsBidFind.StatusId==1 || rsBidFind.StatusId==2) {// Si esta activa o inactiva por la tienda
		  const t = await model.sequelize.transaction();		//Inicia transaccion 
		  return await model.Bids.update({ // activa publicación
			StatusId:3,status:rsBidFind.status},
		  {where:{id:bidId,shopId:rsBidFind['shop'].id}, transaction:t}
		  ).then(async function(rsBidFindUpdate){
			//Envia notificación vía Email
			mail.sendEmail({
			  "from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', // Enviar correo
			  "to":rsBidFind['shop']['shopRequest']['Account'].email,
			  "subject": 'Publicación Pampatar #'+ rsBidFind.id+' Inactiva',
			  "html":`<!doctype html>
			  <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
			  <hr style="width: 420; height: 1; background-color:#99999A;">
			  <link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
			
			  <div  align="center">
				<h2 style="font-family:sans-serif; color:#ff4338;" >¡Pampatar ha dado de baja tu publicación!</h2>
				<p style="font-family:sans-serif; font-size: 19px;" > Su publicación <b> `+ rsBidFind.title +`</b> ha sido inactivada por el Adminstrador de Pampatar</p>
							  
			  </div>
			  <br><br><br>
				<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
				<br>
				<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
				  <p align="center">	
					<a href="https://pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://pampatar.cl/legal/politicas-de-privacidad/">Términos y condiciones</a> | <a href="https://pampatar.cl/legal/">Términos y condiciones</a> | <a href="https://pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
				  </p>					
			  
				  <p  align="center" >
				  info@pampatar.cl
					  Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
				  </p>
				</div>`
				
			});
			t.commit() // Confirma rechazo
			res.json({"data":{"result":true,"message":"Publicación dada de baja satisfactoriamente"}})
		  }).catch(async function(error){
			console.log(error);
			t.rollback();
			res.json({"data":false,"message":"Algo salio mal activando publicación"})
		  })
		}else{
		  res.json({"data":{"result":false,"message":"Esta publicación se dió de baja anteriormente"}})
		}
	  }else{
		res.json({"data":{"result":false,"message":"Publicación no registrada"}})
	  }
	})
  }
  async function getActiveAccount(req,res){ // Cuentas activas
	await model.Account.findAll({
		attributes:['id','name','email'],
		where:{statusId:1}
	}).then(async function(rsactiveAccount){
		res.json(rsactiveAccount);
	}).catch(async function(error){
		res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo cuentas de usuario"}})
	})
}
async function getActiveRole(req,res){ // Roles activas
	await model.Roles.findAll({
		attributes:['id','name'],
		where:{StatusId:1}
	}).then(async function(rsActiveRole){
		res.json(rsActiveRole);
	}).catch(async function(error){
		res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo grupos de usuario"}})
	})
}
async function getActiveAccountByRole(req,res){ // Cuentas activas por role
	const{RoleId}=req.params
	
		await model.accountRoles.findAndCountAll({
			attributes:['id'],
			where:{RoleId},
			include:[{
				model:model.Account,
				attributes:['id','name','email']
			},{
				model:model.Roles,
				attributes:['id','name']
			}]
		}).then(async function(rsactiveAccount){
			res.json(rsactiveAccount);
		}).catch(async function(error){
			
			res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo cuentas de usuario"}})
		})
	
}
async function sendNotificationsToGroup(data,res){
	const {roleId,title,text,extra}=data.body;
	console.log(data.body)
	if(data.from==null){
		data.from='Administrador Pampatar'
	}
	await model.accountRoles.findAndCountAll({
		where:{RoleId:roleId}
	}).then(async function(rsAccountRole){
		if(rsAccountRole.count>0){
			for (let index = 0; index < rsAccountRole.count; index++) {
				await model.notifications.create({ // envia notificación de pedido al vendedor
					from:data.from,
					accountRolesId:rsAccountRole['rows'][index].id,// cuenta y rol del vendedor quien recibe
					body:{
						title,
						text,
						extra
					},
					read:false
				});
			};
			res.json({"data":{"result":true,"message":"Notificación enviadas satisfactoriamente"}})
		}else{
			res.json({"data":{"result":false,"message":"Debe indicar el grupo del usuario"}})
		}
		
	}).catch (async function(error){
		console.log(error)
		res.json({"data":{"result":false,"message":"Algo salió mal validando grupo"}})
	})
}
async function sendEmail(data,res){
	const{accountId,subject,html}=data.body;	
	await model.Account.findOne({
		attributes:['id','name','email'],
		where:{id:accountId}
	}).then(async function(rsAccount){
		mail.sendEmail({
			from:'"Pampatar" <' + process.env.EMAIL_ADMIN + '>',
			to:rsAccount.email,
			subject,
			html
		}).then(async function(mailsend){
			if(mailsend){
				res.json({"data":{"result":true,"message":"Notificaión de correo enviada"}});
				return true;
			}else{
				res.json({"data":{"result":true,"message":"Algo salió mal enviando notificaión de correo"}});
				return false;
			}
		}).catch(async function (error){
			res.json({"data":{"result":false,"message":"Algo salió mal enviando notificaión de correo"}});
			return false;
		})
	}).catch(async function (error){
		res.json({"data":{"result":false,"message":"Algo salió mal validando cuenta de usuario"}});
		return false;
	})

}
async function sendEmailToRoleGroup(data,res){
	const{RoleId,subject,html}=data.body;
	await model.accountRoles.findAndCountAll({
		where:{RoleId},
		include:[{
			model:model.Account,
			attributes:['id','name','email']
		}]
	}).then(async function(rsAccountRole){	
		var failed=[];
		var sending=[];
		var totalFailed=0;
		var totalSending=0;
		
		for (let index = 0; index < rsAccountRole.count; index++) {
			
			await mail.sendEmail({
				from:'"Pampatar" <' + process.env.EMAIL_ADMIN + '>',
				to:rsAccountRole['rows'][index]['Account'].email,
				subject,
				html
			}).then(async function (rsEmail){				
				sending.push({email:rsAccountRole['rows'][index]['Account'].email}); 
				totalSending=totalSending+1; //Contador de enviador
			}).catch(async function (error){
				totalFailed=totalFailed+1; //suma n enviados
				failed.push({email:rsAccountRole['rows'][index]['Account'].email});
			})
		}
		failed.push({total:totalFailed});
		sending.push({total:totalSending});
		res.json({"data":{sending,failed}});
	}).catch(async function (error){
		
		res.json({"data":{"result":false,"message":"Algo salió mal validando cuenta de usuario"}});
	})
}
async function getActiveAccountByName(req,res){ // Cuentas activas por nombre
	const {name,roleId}=req.params
	if(roleId==5){ //Si es Vendedor -- recibe nombre de la tienda
		await model.shop.findAll({
			attributes:['id','name'],
			where:{
				name:{ [Op.iLike]: '%' + name +'%'}
			},		
			include:[{
				model:model.shopRequest,
				attributes:['id'],
				include:[{
					model:model.Account,
					attributes:['id','name','email']
				}]
			}]
		}).then(async function(rsactiveAccount){
			res.json(rsactiveAccount);
		}).catch(async function(error){
			console.log(error);
			res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo cuentas de usuario"}})
		})
	}else if(roleId==7){// Si es adminstrador - Recibe nombre del adminitrador
		await model.Account.findAll({
			attributes:['id','name','email'],
			include:[{
				model:model.People,
					attributes:['id','firstName','lastName'],
					where:{ [Op.or]: [
						{ firstName: { 
								[Op.iLike]: '%' + name +'%'
							}
						},
						{ lastName: { 
								[Op.iLike]: '%' + name +'%'
							}
						}
					  ]}
			}]
		}).then(async function(rsactiveAccount){
			res.json(rsactiveAccount);
		}).catch(async function(error){
			console.log(error);
			res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo cuentas de usuario"}})
		})
		
	}else if(roleId==6){ // Si es comprador -- recibe email del comprador
		await model.Account.findAll({
			attributes:['id','name','email'],
			where:{email:{ 
				[Op.iLike]: '%' + name +'%'
			}}
		}).then(async function(rsactiveAccount){
			res.json(rsactiveAccount);
		}).catch(async function(error){
			console.log(error);
			res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo cuentas de usuario"}})
		})
	}else{
		res.json({"data":{"result":false,"messaje":"Debe indicas el grupo de usuarios"}})
	}

	
}
module.exports={preShop,shopContract,getShopRequestInEvaluation,getShopRequestPreAproved,getContractByShop,
	getShopAll,getShopByName,getProfileShop,taxUpdate,getTaxCurrents,getTaxHistory,getShopRequestAll,
	editShopContract,getShopByContractStatus,shopDisable,shopEnable,bidInEvaluation,
	bidApprove,getAllBidByShop,bidReject,getBidUpdateRequestApproved,bidRevoke,bidActivate,getBidUpdateRequestList,
	getImgById,getBidUpdateRequestReject,bidRejectAdmin,bidActiveAdmin,getActiveAccount,getActiveAccountByRole,
	getActiveRole,sendNotificationsToGroup,sendEmail,sendEmailToRoleGroup,getActiveAccountByName
};