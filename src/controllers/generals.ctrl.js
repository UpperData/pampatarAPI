const model=require ('../db/models/index');
const { Op } = require("sequelize");
require ('dotenv').config();
var jwt=require('jwt-simple');
const mail = require('./mail.ctrl');
const moment=require('moment');

async function currentAccount(token){
	try{
		var  payload= await jwt.decode(token,process.env.JWT_SECRET);
		
		if (Date.now() >= payload.exp * 1000) {
			return false;
		}else{
			const dataToken={"data":{"account":payload.account,"role":payload.role, "people":payload.people,"shop":payload.shop,
			"type":payload.type,"dateStart":payload.dateTimeLogin,"bid":payload.bidId}}
			return dataToken;  
		}
	}catch(erro){
		return false;
	}
}

async  function getDocType(req,res){
	return await model.docType.findAndCountAll({where: {statusId:1}})
		.then(async function(rsResult){
			return res.json({data:{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		});

}
async  function bank(req,res){
	return await model.bank.findAndCountAll()
		.then(async function(rsResult){
			return res.json({data:{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		});

}

async  function getDocTypeByPeopleType(req,res){// Elaborando
	const{peopleTypeId}=req.params

	return await model.docType.findAndCountAll({attributes:['id','name'],where: {statusId:1,peopleTypeId}})
		.then(async function(rsResult){
			return res.json({"data":{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){
			//console.log(error);	
			return res.json({"data":{"result":true,"message":"No se pudo retornar docmentos de Identidad"}})		
			
		})

}
async  function getPhoneType(req,res){
	return await model.phoneType.findAndCountAll({where: {statusId:1}})
		.then(async function(rsResult){
			return res.json({data:{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		});
}
async  function getStoreType(req,res){
	return await model.storeType.findAndCountAll({where: {statusId:1}})
		.then(async function(rsResult){
			return res.json({data:{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		});
}
async  function getChannels(req,res){
	return await model.salesChannels.findAndCountAll({where: {statusId:1}})
		.then(async function(rsResult){
			return res.json({data:{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		});	
}
async  function getAffirmations(req,res){
	return await model.affirmations.findAndCountAll({where: {statusId:1}})
		.then(async function(rsResult){
			return res.json({data:{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		});	
}
async  function getNationality(req,res){
	return await model.Nationalities.findAndCountAll()
		.then(async function(rsResult){
			return res.json({data:{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){
			
			return res.json({"data":{"result":false,"message":"No se pudo retonar nacionalidad"}})		
			
		})
}
async  function getGender(req,res){
	return await model.Genders.findAndCountAll()
		.then(async function(rsResult){
			return res.json({data:{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){

			return res.json({"data":{"result":false,"message":"No se pudo procesar solicitud"}})		
			
		})
}

async function getShopId(token){

	const dataToken=await currentAccount(token);   
	//console.log(dataToken) ;
	try{
	  // Valida que tenga permiso de vendedor
	  const isAutorized= dataToken['data']['role'].find(function(e) {
		if( e.id == 5){
		  return true    
		}else{
		  return false		  
		}
	  })
	  if(isAutorized){
		return await model.Account.findAll({where:{id:dataToken['data']['account'].id, statusId:1,confirmStatus:true},
		  include: [{
			model: model.shopRequest,  
			required:true,
			where: { status:{ 
				  [Op.contains]: [{id: 2}] // POSTULACIÓN APROBADA     
					} } , 
			  include:[{
				model: model.shop,
				required:true,
				where: { statusId:1 }  // TIENDA ACTIVA 
			  }]    
		  }]
		}).then(async function(rsAccount){

		  if(rsAccount){
			return  rsAccount[0]['shopRequests'][0]['shop']
		  }else{
			return {data:{"result":false,"message":"No existe la tienda"}} 
		  }

		}).catch(async function(error){
		 // console.log(error)
		 return {data:{"result":false,"message":"Error identificando tienda, consulte su estatus con el administrador del sistema"}};
		})      
		
	  }
	}
	catch(error){
	  return {data:{"result":false, "message":"No fue posible identificar si tienda, consulte su estatus con el administrador del sistema"}};
	}
  }
  async  function getPeopleType(req,res){
	return await model.peopleType.findAndCountAll({attributes:['id','name'],where: {StatusId:1}})
		.then(async function(rsResult){
			return res.json(rsResult);
		}).catch(async function(error){
			console.log(error);	
			return res.json({"data":{"result":false,"message":"No se pudo retornar tipo de persona"}})		
			
		})
}
async  function getRegion(req,res){
	return await model.region.findAndCountAll({attributes:['id','name']})
		.then(async function(rsResult){
			return res.json({"data":{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){
			console.log(error);	
			return res.json({"data":{"result":false,"message":"No se pudo retornar regiones"}})		
			
		})
}
async  function getProvince(req,res){
	const{regionId}=req.params
	return await model.provinces.findAndCountAll({attributes:['id','name'],where:{regionId}})
		.then(async function(rsResult){
			return res.json({"data":{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){
			console.log(error);	
			return res.json({"data":{"result":false,"message":"No se pudo retornar Provincias"}})		
			
		})
}
async  function getComuna(req,res){
	const{provinceId}=req.params
	return await model.comuna.findAndCountAll({attributes:['id','name'],where:{provinceId}})
		.then(async function(rsResult){
			return res.json({"data":{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){
			console.log(error);	
			return res.json({"data":{"result":false,"message":"No se pudo retornar Comuna"}})		
			
		})
}
async  function getAddrTypes(req,res){
	
	return await model.addressType.findAndCountAll({attributes:['id','name']})
		.then(async function(rsResult){
			return res.json({"data":{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){
			console.log(error);	
			return res.json({"data":{"result":false,"message":"No se pudo retornar Comuna"}})		
			
		})
}
async  function processType(req,res){
	
	return await model.processType.findAndCountAll({attributes:['id','name']})
		.then(async function(rsResult){
			return res.json({"data":{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){
			console.log(error);	
			return res.json({"data":{"result":false,"message":"No se pudo retornar tipo de proceso de producción"}})		
			
		})
}
async  function getTypeBankAccount(req,res){
	
	return await model.typeBankAccount.findAndCountAll({attributes:['id','name']})
		.then(async function(rsResult){
			return res.json({"data":{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){
			console.log(error);	
			return res.json({"data":{"result":false,"message":"No se pudo retornar tipos de cuenta"}})		
			
		})
}
async function thisRole(req,res){ // Valida rol del usuario

	const account=req[0];
	const roleId=req[1];	
	try{
		var isValid=false		
		for (var i = 0; i < roleId['roleId'].length; i++){ 
			//console.log(account['accountId']);
			var rsAccountRoles=  await model.accountRoles.findAndCountAll({
				attributes:['id','StatusId'],
				where:{AccountId:account['accountId'],RoleId:roleId['roleId'][i].id}
			})			
			if (rsAccountRoles.count>0 && rsAccountRoles.rows[0].StatusId==1 ){
				isValid= true           
				break;
			}	
		} 
		return isValid;
	}
	catch(error){
		console.log(error);
		return res.json({"data":{"result":false,"message":"Algo salio mal, no se pudo validar el rol"}})
	}

}
async function shopByAccount(req,res){
	const {accountId}=req;
	return await model.shop.findAndCountAll({attributes:['id','name'],
		include:[{
			model:model.shopRequest,
			attributes:['id'],
			include:[{
				model:model.Account,
				attributes:['id','name'],
				where:{id:accountId},
				required:true
			}],
			required:true
		}]
	}).then(async function(rsShop){
		
		if(rsShop.count>0){
			return {"data":{"result":true,"shop":{"id":rsShop['rows'][0].id,"name":rsShop['rows'][0].name,"postulacionId":rsShop['rows'][0]['shopRequest'].id}}}
		}else{
			return {"data":{"result":false,"message":"Usuario no posee tienda aprobada"}}
		}		
	})

}

async function isShopUpdated(data){
  const{shopId}=data;
   // const dataToken=currentAccount(req.token) 
   // const AccountId=dataToken.account;
   // var updated;
	return await model.shop.findOne({were:{shopId},
		include:[{
			model:model.shopRequest,
			required:true,
			include:[{			
				model:model.Account,
				required:true,
				include:[{
					model:model.People,
					required:true
				}]

			}]
		}]
	})
    .then(async function(rsShop){
		//console.log("Addresses NUm: "+rsShop.address.length);
		//console.log("Cuentas: "+rsShop.paymentCong);
		//console.log("Store: "+rsShop.storeType['data'].length);
		//console.log("Process: "+rsShop.processId);
		//console.log("Phone: "+rsShop.phone.length);
		//console.log("Empleados: "+rsShop.employees);
		//console.log("Des: "+rsShop.shopDescription);
		//console.log("Socios: "+rsShop.partner.length);
		//console.log("Status: "+rsShop.statusId);
		//console.log("IsLocal: "+rsShop.isLocal);
		/*if(rsShop){
			if(rsShop.address.length<1 || rsShop.paymentCong==null || rsShop.storeType['data'].length<1 || 
				rsShop.processId==null || rsShop.phone.length<1 || rsShop.employees==null || rsShop.shopDescription==null
				|| rsShop.partner.length<1 || rsShop.statusId==2 || rsShop.isLocal==null  ){                       
				
			updated=false;

			}else{
			updated=true;
			} 

		}*/
		  
		//return updated
		return false;
    }).catch( function(error){
		console.log(error);
        return false //{"data":{"result":false,"message":"Algo salió mal buscando estatus de su tienda"}};
        
    })
}
async  function getSize(req,res){
	
	return await model.size.findAndCountAll({attributes:['id','name']})
	.then(async function(rsResult){
		return res.json({"data":{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
	}).catch(async function(error){
		console.log(error);	
		return res.json({"data":{"result":false,"message":"No se pudo retornar medidas"}})		
		
	})
}
async function serviceType(req,res){
	return await model.serviceType.findAndCountAll({attributes:['id','name']})
	.then(async function(rsResult){
		return res.json({"data":{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
	}).catch(async function(error){
		console.log(error);	
		return res.json({"data":{"result":false,"message":"No se pudo retornar tipo de servicio"}})		
	})
}
async function inventoryStock(data){ //stock de un SKU
	const{inventoryId,AccountId}=data;

	await model.inventoryTransaction.findAll({
	attributes: ['id','type','createdAt',[model.sequelize.fn('sum', model.sequelize.col('quantity')), 'totalVendidos']],
	
	where:{inventoryId,AccountId},
	group:['inventoryTransaction.id']
	}).then(async function(rsInventory){
		console.log(rsInventory);
		return rsInventory;		
	}).catch(async function(error){
		console.log(error);
		return {"data":{"result":false,"message":"Algo salio mal retornando lotes de productos"}};
	});
}
  async function stockMonitorGeneral(data){ // Get stock Product in shop
	const{productId,type,shopId}=data;  	
	//const shop=await getShopId(token);  
	if(type=='product'){ //Stock de Producto
		return await model.inventory.findAll({ // valida existencia en inventario de productos
		attributes:[ 'id','createdAt','note','quantity'],     
		where:{skuId:productId,shopId,StatusId:1},
		group:['inventory.id']
		
		})
		.then(async function(rsInventoryProduct){
			//restar ventas
			var v=0;
			for (var i = 0, len = rsInventoryProduct.length; i < len; i++) {
				v=v+rsInventoryProduct[i].quantity;
			}
		return {"data":{"result":true,"total":v}};
		
		}).catch(async function(error){
		console.log(error);
		return {"data":{"result":false,"message":"Algo salió mal retornando stock"}};
		})      
	}else if(type=='service'){ // Stock de servicio
		return await model.inventoryService.findAll({ // valida existencia en inventario de servicios
		attributes:{exclude:['createdAt','shopId','type']},
		where:{serviceId:productId,shopId,StatusId:1}
		}).then(async function(rsInventoryService){
			
			var v=0;
			for (var i = 0, len = rsInventoryService.length; i < len; i++) {
				v=v+rsInventoryService[i].quantity;
			}
			return {"data":{"result":true,"total":v}};
		
		}).catch(async function(error){	
			console.log(error);		
		return {"data":{"result":false,"message":"Algo salió mal retornando stock"}};
		})  ;
	}else {
		return {"data":{"result":false,"message":"Debe indicar un producto o servicio"}};
	}
	  
  }
  async function lotDetails(data){
	  const {inventoryId}=data	  
	return await model.inventoryTransaction.findAll({
		attributes: [[model.sequelize.fn('sum', model.sequelize.col('inventoryTransaction.quantity')), 'outTotal']],
		group:['inventoryTransaction.id','inventory.id'],
		include:[{
			model:model.inventory,	
			where:{skuId:inventoryId}
		}]
	}).then(async function(rsLotDetails){
		return parseFloat(rsLotDetails);
	}).catch(async function(error){
		console.log(error);
		return {"data":{"result":false,"message":"Algo salio mal retornando detalles del lote"}};
	})
  }
  async function currentPriceProduct(req,res){ // Retorna precio + Comisión + Impuestos
	const shop=await getShopId(req.header('Authorization').replace('Bearer ', ''));  
	const{skuId,type}=req.params
	if(type=='product'){
		await model.shopContract.findOne({where:{shopId:shop.id}})
		.then(async function(rsContract){
			if(rsContract && rsContract.proPercen>0){
				await model.skuPrice.findOne
				({attributes:['price','createdAt'], //--> precio mas reciente
				where:{shopId:shop.id,skuId},
				order: [['createdAt','DESC' ]]
				})
				.then(async function(rsPrice){
					if (rsPrice==null){
						res.json({"data":{"result":false,"message":"Producto sin precio asignado"}})
					}else{
						price=rsPrice.price;
						const theTax= await model.taxValue.findOne({where:{StatusId:1,taxId:1}});// optiene el valor de IVA					
						const endPrice=(parseFloat(rsContract.proPercen/100)* parseFloat(price)) + (parseFloat(theTax.dataValues.value/100) * parseFloat(price)) + parseFloat(price);
						rsPrice.dataValues.endPrice=endPrice;
						rsPrice.dataValues.tax=theTax.value;
						rsPrice.dataValues.comission=rsContract.proPercen;
						res.json(rsPrice);
					}
				}).catch(async function(error){
					console.log(error)
				res.json({"data":{"result":false,"message":"Algo salió mal opteniendo el precio actual"}})
				})
			}else{
				res.json({"data":{"result":false,"message":"Tienda sin comisiones registradas"}})
			}
		})
	} else if(type=='service'){
		await model.shopContract.findOne({where:{shopId:shop.id}})
		.then(async function(rsContract){
			if(rsContract && rsContract.servPercen>0){
				await model.servicePrice.findOne({attributes:['price','createdAt'], //--> precio mas reciente
				where:{shopId:shop.id,serviceId:skuId},
				order: [['createdAt','DESC' ]]
				})
				.then(async function(rsPrice){
					if (rsPrice==null){
						res.json({"data":{"result":false,"message":"Servicio sin precio asignado"}})
					}else{	
						price=rsPrice.price;				
						const theTax= await model.taxValue.findOne({where:{StatusId:1,taxId:1}});// optiene el valor de IVA					
						const endPrice=(parseFloat(rsContract.servPercen/100)* parseFloat(price)) + (parseFloat(theTax.dataValues.value/100) * parseFloat(price)) + parseFloat(price);
						rsPrice.dataValues.endPrice=endPrice;
						rsPrice.dataValues.tax=theTax.value;
						rsPrice.dataValues.comission=rsContract.servPercen;
						res.json(rsPrice);
					}
				}).catch(async function(error){
					console.log(error)
				res.json({"data":{"result":false,"message":"Algo salió mal opteniendo el precio actual"}})
				})
			}else{
				res.json({"data":{"result":false,"message":"Tienda sin comisiones registradas"}})
			}
		})
	} else {
		res.json({"data":{"result":false,"message":"Debe indicar si es producto o servicio"}})
	}
  }
  async function getDays(req,res){
	await model.days.findAll({attributes:['id','name']})
	.then(async function(rsDays){
		res.json(rsDays)
	}).catch(async function(error){
		res.json({"data":{"result":false,"message":"Algo salió mal retornando días de la semana"}})
	})
  }
  async  function setInvnetory(type,quantity){
	if(quantity<0){
	  quantity=(quantity)*(-1); //convierte los negativos a positivos
	}
	if(type=='in'){ // Si es una entrada
		var msj="Inventario incroporado con satisfactoriamente"      
	}
	if(type=='out'){// Si es una salida
	  quantity=(quantity)*(-1);
	  var msj="Inventario desincorporado con satisfactoriamente";
	}
	return {"quantity":quantity,"msj":msj}
  }
  async function lotExistence(data){ //Ventas de un producto
	const {skuId,shopId}=data;	 
	return await  model.inventoryTransaction.findAll(	{
		attributes: ['id', 'quantity','type'],			
		where:{type:'out'},
		include:[{
			model:model.inventory,
			attributes:['id','quantity','updatedAt',],
			required:true,
			where:{skuId,shopId,StatusId:1}
		}],
		group:['inventoryTransaction.id','inventory.id']
	}).then(async function(rsLotExistence){		
		return rsLotExistence;
	}).catch(async function(error){
		
		return {"data":{"result":false,"message":"Algo salió mal retornando stock de producto"}}
	})
	
  }
  async function accountCurrent(token){
	const dataToken=await currentAccount(token);
	return dataToken['data']['account']
  }

  async function getTax(req,res){
	await model.tax.findAll({
		attributes:['id','name'],
		include:[
			{
				model:model.taxType,
				attributes:['id','name']		
			}
		]
		})
	.then(async function(rsTax){
		res.json(rsTax);
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retornando impuestos"}})
	})
}

async function getTaxOne(req,res){
	const{taxId}=req.params;
	await model.tax.findOne({attributes:['id','name'],
	where:{id:taxId},
		include:[{
			model:model.taxValue,
			attributes:['id','value','createdAt'],
			required:false,
			where:{StatusId:1}
		},{
			model:model.taxType,
			attributes:['id','name'],
			required:true
		}]
	
	})
	.then(async function(rsTax){
		res.json(rsTax);
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retornando impuesto"}})
	})
}
async function getStatus(req,res){
	await model.Status.findAll({attributes:['id','name']})
	.then(async function(rsStatus){
		res.json(rsStatus);
	}).catch(async function(error){
		res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo estatus"}})
	})
}
async function skuType(req,res){
	await model.skuType.findAll({attributes:['id','name']})
	.then(async function(rsSkuType){
		res.json(rsSkuType);
	}).catch(async function(error){
		res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo tipo de producto"}})
	})
}
async function skuInInventory(req,res){ // Retorna productos, servicios en estock
	const {bidType,bidTypeId}=req.params;	
	token=req.header('Authorization').replace('Bearer ', '')
	if(token){
		const shop=await currentAccount(token);
		try{
			await currentAccount(token)
			.then(async function (rsCurrentAccount){
				console.log(rsCurrentAccount)
				if (bidType=='product'){
					return await model.sku.findAll({
						attributes:['id','name'],
						include:[
							{
								model:model.skuType,
								required:true,
								attributes:['id','name'],
								where:{id:bidTypeId}
							},{
								model:model.shop,
								required:true,
								attributes:['id'],
								where:{id:shop['data']['shop'].id}
							},{
								model:model.inventory,
								required:true,
								attributes:['id'],
								where:{StatusId:1}
							}
						],order:[
								[model.skuType, 'name', 'DESC']
							]
					}).then(async function(rsresult){
						res.json(rsresult);
					}).catch(async function(error){
						console.log(error);
						res.json({"data":{"result":false,"messaje":"Algo salió mal retornando productos"}});
					})
				}else if(bidType=='service'){
					//console.log(shop);
					return await model.service.findAll({
						attributes:['id','name'],
						where:{shopId:shop['data']['shop'].id},
						include:[
							{
								model:model.shop,
								attributes:['id'],
								required:true
							},{
								model:model.inventoryService,
								required:false,
								attributes:['id'],
								where:{StatusId:1},
								include:[
									{
										model:model.serviceType,
										attributes:['id','name'],
										required:true
									}
								]
							}
						]
					}).then(async function(rsresult){
						res.json(rsresult);
					}).catch(async function(error){
						console.log(error);
						res.json({"data":{"result":false,"messaje":"Algo salió mal retornando servicios"}});
					})
				}else{
					res.json({"data":{"result":false,"messaje":"Debe indicar el tipo de producto"}});
				}
			})
			
		}catch(error){
			console.log(error);
			res.json({"data":{"result":false,"messaje":"algo salió mal retornando lista de productos"}});
		}
	}else{
		res.json({"data":{"result":false,"messaje":"Debe indicar el tipo de producto"}});
	}
}
async function skuInInventoryById(data){ // valida si un producto o servicio esta en inventario
	const {bidType,shopId,skuId}=data;	
	//console.log(data);
	try{
		if (bidType=='product'){
			return await model.sku.findAndCountAll({
				attributes:['id','name'],
				where:{id:skuId},
				include:[
					{
						model:model.skuType,
						required:true,
						attributes:['id','name']
					},{
						model:model.shop,
						required:true,
						attributes:['id'],
						where:{id:shopId}
					},{
						model:model.inventory,
						required:true,
						attributes:['id'],
						where:{StatusId:1}
					}
				],order:[
						[model.skuType, 'name', 'DESC']
					]
			}).then(async function(rsresult){
				if(rsresult.count>0){
					return true;
				}else{
					return false
				}
				
			}).catch(async function(error){
				console.log(error);
				return {"data":{"result":false,"messaje":"Algo salió mal retornando productos"}};
			})
		}else if(bidType=='service'){
			return await model.service.findAndCountAll({
				attributes:['id'],
				where:{id:skuId},
				include:[
					{
						model:model.shop,
						required:true,
						where:{id:shopId}
					},{
						model:model.inventoryService,
						required:true,
						where:{StatusId:1},
						include:[
							{
								model:model.serviceType,
								attributes:['id','name'],
								required:true
							},
							{
								model:model.Status,
								attributes:['id','name'],
								required:true
							}
						]
					}
				]
				
			}).then(async function(rsresult){				
				if(rsresult.count>0){
					return true;
				}else{
					return false
				}
			}).catch(async function(error){
				console.log(error);
				res.end()
				return {"data":{"result":false,"messaje":"Algo salió mal retornando servicio"}};
				
			})
		}else{
			return {"data":{"result":false,"messaje":"Debe indicar el tipo de producto"}};
		}
	}catch(error){
		console.log(error);
		return {"data":{"result":false,"messaje":"algo salió mal obtenidos lista de productos"}};
	}
	
}

async function ShopStatusGeneral(data){ // Retorna estatus de una tienda
	const{shopId}=data;
	return await model.shop.findOne({ // valida su existe la tienda
		attributes:['id','name'],
		where:{id:shopId,statusId:1},
		include:[
			{
				model:model.shopRequest,
				attributes:['id'],
				include:[
					{
						model:model.Account,
						attributes:['id','email'],
						where:{statusId:1}
					}
				]
			}
		]
	}).then(async function (rsFnShop){	
		//console.log(rsFnShop)	
		if (rsFnShop){
			return await model.accountRoles.findAndCountAll({ // valida que tenga role vendedor
				attributes:['id'],
				where:{AccountId:rsFnShop['shopRequest']['Account'].id,RoleId:5},
				include:[
					{
						model:model.Status,
						attributes:['id','name'],
						where:{id:1} //Role activo
					}
				]
			}).then(async function(rsAccountRoles){ //valida que tenga role vendedor				
				if(rsAccountRoles.count>0){
					return true;
				}else{
					return false;
				}
			}).catch(function(error){
				console.log(error);	
				console.log({ data:{"result":false,"message":"Algo salió mal retornando estatus "}});
				return { data:{"result":false,"message":"Algo salió mal retornando estatus "}};
			})
		}else{
			return({"data":{"result":true,"message":"Inactiva"}});
		}
		
	}).catch(function(error){
		console.log(error);
		console.log(({"data":{"result":true,"message":"Algo salió mal validando estatus"}}));
		return { data:{"result":false,"message":"Algo salió mal validando estatus "}};
		//res.json({ data:{"result":false,"message":"Algo salió mal, no se pudo buscar "}})
	})
}
async function getShopStatus(req,res){ // Retorna estatus de una tienda
	const{shopId}=req.params;
	 // Retorna estatus de una tienda
		
	return await ShopStatusGeneral({shopId})
	.then(async function (rsShopStatus){
		res.json(rsBrands);
	}).catch(function(error){
		console.log(error);
		return { data:{"result":false,"message":"Algo salió mal validando estatus "}};
		//res.json({ data:{"result":false,"message":"Algo salió mal, no se pudo buscar "}})
	})
}
async function getBrands(req,res){
	return await model.Brands.findAll({
		attributes:['id','name'],
		order:['name']
	})
	.then(async function(rsBrands){
		res.json(rsBrands);
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo Marcas"}})
	})
}
async function getDisponibility(req,res){
	return await model.disponibility.findAll({
		attributes:['id','name'],
		order:['name']
	})
	.then(async function(rsDisponibility){
		res.json(rsDisponibility);
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"messaje":"Algo salió mal opteniendo disponibilidad"}})
	})
}
async function getOneBidPreView(req,res){
	const {tOEekn}=req.params;
	const account=await currentAccount(tOEekn);

	//console.log(account['data']);
	if(!account['data']){
		//res.redirect(process.env.HOST_FRONT+'expired/error');
		res.json("error en token");
	}
	else{
		//console.log(account['data']);
		return await model.Bids.findOne({
			where:{id:account['data']['bid']},
			include:[
				{
					model:model.skuType
				},{
					model:model.shop,
					attributes:['id','name']
				},{
					model:model.Brands,
					attributes:['id','name']
				},{
					model:model.disponibility,
					attributes:['id','name']
				}
			]
		}).then (async function(rsBid){
			//console.log(rsBid);

			//***** RETORNAR IMAGENES  */
			var imgs=[];			
			for (var i = 0; i < rsBid.photos.length; i++){ 
				rs= await model.attachment.findOne({
					attributes:['data','attachmentTypeId'],
					where:{id:rsBid.photos[i]}
				});
				imgs.push({id:rsBid.photos[i],img:rs.data});
			}
			rsBid.dataValues.images=imgs;
			/****************************/

			/** OPTIENE INFROMACIÓN DEL SKU */
			if(rsBid.skuTypeId==1) {//si es servicio
				// VENTAS Y STOCK
				var rsStock = await stockMonitorGeneral({"productId":rsBid.skuId,"type":'product',"shopId":account['data']['shop'].id}) // Get stock in shop LOTES
				var rsSales =await getSalesdBySku({"productId":rsBid.skuId,"type":'product'}); //VENTAS
				const totalStock=new Number(rsStock['data'].total)
				var totalSales=new Number(rsSales);				
				if(isNaN(totalSales)){
						totalSales=0; // cantidad de productos disponibles
				}
				if(isNaN(totalStock)){
					totalStock=0; // cantidad de productos disponibles
				}
				//DESCRIPCION DEL SERVICO
				const currentStock= totalStock- totalSales; 
				rsSku= await  model.service.findOne({
					attributes:['id','name']
				});
				rsBid.dataValues.rsSku
			}else{

				// VENTAS Y STOCK
				var rsStock = await stockMonitorGeneral({"productId":rsBid.skuId,"type":'product',"shopId":account['data']['shop'].id}) // Get stock in shop LOTES
				var rsSales =getSalesdBySku({"productId":rsBid.skuId,"type":'product'}); //VENTAS
				const totalStock=new Number(rsStock['data'].total)
				var totalSales=new Number(rsSales);				
				if(isNaN(totalSales)){
						totalSales=0; // cantidad de productos disponibles
				}
				if(isNaN(totalStock)){
					totalStock=0; // cantidad de productos disponibles
				}
				const currentStock= totalStock- totalSales;  
			/*FiN VENTAS STOCK*/
				rsSku= await  model.sku.findAll({
					attributes:['id','name'],
					where:{id:rsBid.skuId},
					include:[{
							model:model.skuType
						},
						{
							model:model.inventory,
							attributes:['id'],
							where:{StatusId:1,skuId:rsBid.skuId},
							include:[{
									model:model.shop,
									attributes:['id','name','logo']
									
								},{
									model:model.Warehouse,
									attributes:['id','name']
								}
							]
						}
					],group:['sku.id','skuType.id','inventories.id','inventories->shop.id','inventories->Warehouse.id']
				});
				rsBid.dataValues.description=rsSku;
				//OPTIENE STOCK
				rsBid.dataValues.stock=currentStock
				//CANTIDAD VENDIDOS
				rsBid.dataValues.sales=totalSales
				//OPTIENE PRECIO
				rsSkuPrice= await  model.skuPrice.findOne({
					attributes:['price'],
					where:{skuId:rsBid.skuId}
				});
				rsBid.dataValues.price=rsSkuPrice;
			}
			res.status(200).json(rsBid)
		}).catch(async function (error){	
			console.log(error);
			res.json({
				"data":{"result":false,"message":"Algo salio mal generando vista previa "}
			})
		});
	}
};
async function getBidAll(req,res){
	const token= req.header('Authorization').replace('Bearer ', '');
  	if(!token){
		return await model.Bids.findAll({
			
		})
	  }else{
		  
	  }
}
async function getBidTypes(req,res){
	return await model.bidType.findAll({
		attributes:{exclude:['createdAt','updatedAt']},		
	}).then(async function (rsBidTypes){
		res.json(rsBidTypes);
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal retornando tipo de Publicaciones, intente nuevamente"}})
	})
}
async function getMaterials(req,res){
	return await model.Bids.findAll({
		attributes:['id','skuId'],
		include:[{
				model:model.bidType,
				where:{id:3}
			}
		]
		
	}).then(async function (rsBid){
		var Service=[];
		//console.log(rsBid);
		for (var i = 0; i < rsBid.length; i++){ 
			await model.inventory.findOne({
				attributes:['id'],
				where:{StatusId:1},
				include:[{
					model:model.sku,
					attributes:['id','name'],
					where:{id:rsBid[i].skuId}

				}]
			}).then(async function(rsFind){
				
				if(rsFind!=null){
					Service.push(rsFind.sku);
				}
			})
		}
		//** En evaluacion  */
		const unicos = Service.reduce( (accArr, valor) => {
			if (accArr.indexOf(valor) < 0) {
			  accArr.push(valor);
			}
			return accArr;
		  }, []);
		res.json(unicos);
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal retornando materiales, intente nuevamente"}})
	})
}
async function getReasons(req,res){
	return await model.reasons.findAll({
		attributes:{exclude:['createdAt','updatedAt']},		
	}).then(async function (rsReasons){
		res.json(rsReasons);
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal retornando motivos, intente nuevamente"}})
	})
}
async function getImgByBid(req,res){
	const{bidId}=req.params
	return await model.Bids.findOne({
		attributes:['id','photos'],
		where:{id:bidId}	
	}).then(async function (rsImg){
		if(rsImg.photos[0].id){
			console.log(rsImg.photos); 
			var imgs=[];			
			for (var i = 0; i < rsImg.photos.length; i++){ 
				rs= await model.attachment.findOne({
					attributes:['id','data','attachmentTypeId'],
					where:{id:rsImg.photos[i].id},
					include:[{
						model:model.attachmenType,  as:'attachmentType',
						attributes:['id','name']
					}]
				});
				imgs.push({id:rs.id,img:rs.data,type:rs.attachmentTypeId});
			}			
			res.json(imgs);
		}else{
			res.json({"data":{"result":false,"message":"Publicación no Posee Imagenes"}})
		}

	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal, no fue posible retornar imagenes"}})
	})
}
async function getStockBySku(req,res){
	const{productId,type,shopId}=req.params
	if(productId!=null && type!=null && shopId){
		if (type=="product" || type=="service"){
			await stockMonitorGeneral({productId,type,shopId}) // cantidad de productos publicados
			.then(async function(rsStock){				
				const sales=await getSalesdBySku({productId,type}); // cantidad de productos vendidos
				const totalStock=new Number(rsStock['data'].total)
				var totalSales=new Number(sales);				
				if(isNaN(totalSales)){
					 totalSales=0; // cantidad de productos disponibles
				}
				if(isNaN(totalStock)){
					totalStock=0; // cantidad de productos disponibles
			   }
				const stock= totalStock- totalSales; 
				
				if(stock>0){
					res.json({"data":{"result":true,"message":"Disponible",stock}});
				}else{
					res.json({"data":{"result":true,"message":"No disponible",stock}});
				}
			}).catch(async function (error){
				console.log(error)
				res.json({"data":{"result":false,"message":"Algo salió mal opteniendo stock"}})
			});
		}else{
			res.json({"data":{"result":false,"message":"Algo salió mal"}})
		}
		
	}else{
		res.json({"data":{"result":false,"message":"Debe ingresar valores requeridos para optener stock"}})
	}
	
}

async function getSalesdBySku(data){ //Cantidad de ventas NO EL MONTO
	const{productId,type}=data;
	if(type=='product'){
		return await model.inventoryTransaction.findAll({ // consulta cantidad vendida en un lote
		attributes:['quantity'],
		where:{type:'out',},
		include:[{
				model:model.inventory,
				required:true,
				where:{StatusId:1,skuId:productId}
			}
		],
		group:['inventoryTransaction.id','inventory.id']
		}).then(async function(rsInventoryTransaction){			
			var v=0;
			for (var i = 0, len = rsInventoryTransaction.length; i < len; i++) {
				v=v+rsInventoryTransaction[i].quantity
			}
			return v;
		}).catch(async function(error){
			console.log(error);
			return {"data":{"result":false,"message":"Algo salió mal retornando ventas de producto"}};
		})
	}else if(type=='service'){
		return await model.inventoryServiceTransaction.findAll({ // consulta cantidad vendida en un lote
		attributes:['quantity'],
		where:{type:'out'},
		include:[{
				model:model.inventoryService,
				required:true,
				where:{StatusId:1,serviceId:productId}
			}
		],
		group:['inventoryServiceTransaction.id','inventoryService.id']
		}).then(async function(rsInventoryServiceTransaction){
			//console.log(rsInventoryServiceTransaction);
			var v=0 ;	
			for (var i = 0, len = rsInventoryServiceTransaction.length; i < len; i++) {
				v=v+ new Number(rsInventoryServiceTransaction[i].quantity)
			}
			return v;
		}).catch(async function(error){
			console.log(error);
			return {"data":{"result":false,"message":"Algo salió mal retornando ventas de sevicio"}};
		})
	}
}
async function getSalesdByMonthByShop(data){ // Ventas por mes Canyidad y monto
	const{shopId,year,month}=data;
	console.log(data);
	//const startedDate=year+"-"+new Intl.DateTimeFormat('en', { month: '2-digit' }).format(month)+"-"+new Intl.DateTimeFormat('en', { day: '2-digit' }).format("1");
	var startedDate= moment(new Date(year+"-"+month+"-"+'1')).format('YYYY-MM-DD');
	const lastDay = moment(new Date(year+"-"+month)).daysInMonth();//Dias del mes
	var endDate = moment(startedDate).add(lastDay, 'days').calendar();

	let totalSales=0;
	return await model.purchaseOrder.findAll({ // consulta ordenes de comptas entregadas
	attributes:['pay'],
	where:{statusTrackingId:4,shopId,createdAt: {
		[Op.between]: [startedDate,endDate ],
		}}
	}).then(async function(rsPurchaseOrder){
		//console.log(rsPurchaseOrder);
		for (let index = 0; index < rsPurchaseOrder.length; index++) {
			totalSales=rsPurchaseOrder[index].pay.amount + totalSales;
		}
		
		return totalSales;
		
	}).catch(async function(error){
		console.log(error)
		return {"data":{"result":false,"message":"Algo salió mal retornando ventas de producto"}};
	})
	
}
async function bidGetOne(req,res){ // retorna la publicaciones en evaluación
	const {id,shopId} =req.params
	return await model.Bids.findOne({
		where:{id,shopId},
		include:[
			{
				model:model.skuType
			},{
				model:model.shop,
				attributes:['id','name','logo']
			},{
				model:model.Brands,
				attributes:['id','name']
			},{
				model:model.disponibility,
				attributes:['id','name']
			}
		]
	}).then (async function(rsBid){
		if(rsBid){
			//***** RETORNAR IMAGENES  */
			var imgs=[];
			if(rsBid.photos[0].id){
				for (var i = 0; i < rsBid.photos.length; i++){ 
					rs= await model.attachment.findOne({
						attributes:['data','attachmentTypeId'],
						where:{id:rsBid.photos[i].id}
					});
					imgs.push({id:rsBid.photos[i].id,img:rs.data,type:rs.attachmentTypeId});
				}	
			}
			rsBid.dataValues.images=imgs;
			/****************************/

			/** OPTIENE INFROMACIÓN DEL SKU */
			if(rsBid.skuTypeId==3) {//si es servicio
				var rsStock = await stockMonitorGeneral({"productId":rsBid.skuId,"type":'service',"shopId":rsBid['shop'].id}) // Get stock in shop
				rsSku= await  model.service.findOne({
					attributes:['id','name'],
					include:[{
							model:model.inventoryService,
							attributes:['id'],
							include:[{
								model:model.serviceType,
								attributes:['id','name']
							}
						]
						}
					]
				});
				rsBid.dataValues.description=rsSku
				rsBid.dataValues.stock=rsStock
				rsSkuPrice= await  model.servicePrice.findOne({
					attributes:['price'],
					where:{serviceId:rsBid.skuId}
				});
				rsBid.dataValues.price=rsSkuPrice;
			}else{
				var rsStock = await stockMonitorGeneral({"productId":rsBid.skuId,"type":'product',"shopId":rsBid['shop'].id}) // Get stock in shop			
				rsSku= await  model.sku.findAll({
					attributes:['id','name'],
					where:{id:rsBid.skuId},
					include:[{
							model:model.skuType
						},
						{
							model:model.inventory,
							attributes:['id'],
							where:{StatusId:1,skuId:rsBid.skuId},
							include:[{
									model:model.shop,
									attributes:['id']
									
								},{
									model:model.Warehouse
								}
							]
						}
					],group:['sku.id','skuType.id','inventories.id','inventories->shop.id','inventories->Warehouse.id']
				});
				rsBid.dataValues.description=rsSku; // DESCRIPTION
				rsBid.dataValues.stock=rsStock // OPTIENE STOCK
				rsSkuPrice= await  model.skuPrice.findOne({ // OPTIENE PRECIO
					attributes:['price'],
					where:{skuId:rsBid.skuId}
				});
				rsBid.dataValues.price=rsSkuPrice;
			}
			res.status(200).json(rsBid)
		}else{
			res.status(200).json({
				"data":{"result":false,"message":"No se encontró publicación"}
			})
		}
	}).catch(async function (error){	
		console.log(error);
		res.json({
			"data":{"result":false,"message":"Algo salio mal generando vista previa "}
		})
	});
}
async function getAttachmenType(req,res){
	return await model.attachmenType.findAll({
		attributes:{exclude:['createdAt','updatedAt']},
		where:{id:{
			[Op.lte]: 4
		}}
	}).then(async function (rsAttachmentype){
		res.json(rsAttachmentype);
	}).catch(async function(error){
		res.json({"data":{"result":false,"message":"Algo salió mal retornando tipos de solicitudes"}});
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
async function shoppingcarGetGeneral(data) { // retorna un nuevo carrito de comprar 
	const {AccountId} = data;	
	if (AccountId>0) {		
		return await model.shoppingcar.findOne({
			where:{id:AccountId,StatusId:1}
		}).then(async function(rsShoppingcar){
			if(rsShoppingcar){
				totalDes=[];
				for (var i = 0; i < rsShoppingcar.items.length; i++) { // recorre todas las publicaciones
					await model.Bids.findOne({ // busca la publicación
						attributes:['title','skuTypeId','skuId','photos'],
						where:{id:rsShoppingcar.items[i].BidId},
						include:[{
								model:model.skuType, // identifica el tipo de publicación
								attributes:['id','name']
							}
						]
					}).then(async function(rsBid){
						//** DETALLES DEL PRODUCTO **/
						skuDescription=[];
						totalDes=[];
						if(rsBid){
							if(rsBid['skuType'].id==3){ // es un servicio
								skuDescription=await model.service.findOne({
									attributes:['id','name'],
									where:{id:rsBid.skuId},
									include:[{
											model:model.shop,
											attributes:['id','name']
										}
									]
								});
								rsSkuPrice= await  model.servicePrice.findOne({ // OPTIENE PRECIO SERVICIO
									attributes:['price'],
									where:{serviceId:rsBid.skuId}
								});
								var rsStock = await stockMonitorGeneral({"productId":rsBid.skuId,"type":'service',"shopId":skuDescription['shop'].id}) // Get stock in shop
								skuDescription.dataValues.Bid=rsBid;
								skuDescription.dataValues.stock=rsStock['data'].total;
								if(rsSkuPrice){skuDescription.dataValues.price=rsSkuPrice.price;}
							}else if(rsBid['skuType'].id==1 || rsBid['skuType'].id==2){
								skuDescription=await model.sku.findOne({
									attributes:['id','name'],
									where:{id:rsBid.skuId},
									include:[{
											model:model.shop,
											attributes:['id','name']
										}
									]
								});
								rsSkuPrice= await  model.skuPrice.findOne({ // OPTIENE PRECIO PRODUCTO
									attributes:['price'],
									where:{skuId:rsBid.skuId}
								});
								console.log(rsSkuPrice)
								var rsStock = await stockMonitorGeneral({"productId":rsBid.skuId,"type":'product',"shopId":skuDescription['shop'].id}) // Get stock in shop
								skuDescription.dataValues.Bid=rsBid;
								skuDescription.dataValues.stock=rsStock['data'].total;
								if(rsSkuPrice){skuDescription.dataValues.price=rsSkuPrice.price;}
							}
							//****************************/
							rsBid.skuDesc=skuDescription
						}
					})
					totalDes.push({"skuDesc":skuDescription})
				}
				rsShoppingcar.dataValues.itemsCart=totalDes;
				return rsShoppingcar;
			}else{
				return {"data":{"result":false,"message":"Carrito de comprar vacío"}}
			}
			
		}).catch(async function(error){
			console.log(error);
			return {"data":{"result":false,"message":"Algo salió mal retornando carrito, intnete nuevamente"}};
		})
	} else {
		return {"data":{"result":false,"message":"Cuenta de usuario no valida"}};
	}
}

async function sendNotificationsToUser(data,res){
	const {AccountId,RoleId,title,text,extra}=data.body;
	if(data.from==null){
		data.from='Administrador Pampatar'
	}
	await model.accountRoles.findAndCountAll({
		where:{AccountId,RoleId}
	}).then(async function(rsAccountRole){
		if(rsAccountRole.count>0){
			await model.notifications.create({ // envia notificación de pedido al vendedor
				from:data.from,
				accountRoleId:rsAccountRole['rows'][0].id,// cuenta y rol del vendedor quien recibe
				body:{
					title,
					text,
					extra
				},
				read:false
			}).then(async function(rsNotification){  //envia notificaicón via Email de sus pedido
				//eturn true;
				res.json({"data":{"result":true,"message":"Notificación enviada satisfactoriamente"}})
			}).catch(async function(error){
				//return false;
				console.log(error);
				res.json({"data":{"result":false,"message":"Algo salió mal enviando notificación"}})
			});
		}else{
			//return false;
			res.json({"data":{"result":false,"message":"Debe indicar el grupo del usuario"}})
		}
		
	}).catch (async function(error){
		console.log(error)
		res.json({"data":{"result":false,"message":"Algo salió mal validando grupo"}})
	})
}
async function getNotificationByAccountRole(data,res){ //Notificación para 
	const{roleId}=data.params;
	token=data.header('Authorization').replace('Bearer ', '')
	  if(token){
		const account =await currentAccount(token);
		await model.accountRoles.findOne({
		attributes:['id'],
		where:{AccountId:account['data']['account'].id,RoleId:roleId}
		}).then(async function(rsAccountRole){
			await model.notifications.findAndCountAll({ // envia notificación de pedido al vendedor
				attributes:['id','from','body','createdAt'],
				where:{read:false,accountRoleId:rsAccountRole.id}			
			}).then(async function(rsNotification){  //envia notification via Email de sus pedido
				res.json(rsNotification);
			}).catch(async function(error){
				console.log(error);
				res.json({"data":{"result":false,"message":"Algo salió mal retornando notificaiones"}});
			});
		}).catch(async function(error){
			console.log(error);
			res.json({"data":{"result":false,"message":"Algo salió mal validando cuenta de usuario"}});
		});
	}else{
		res.status(403).json({"data":{"result":false,"message":"Sesión invalida"}});	
	}
}
async function readNotifications(data,res){
	const {id,roleId}=data.params;
	token=data.header('Authorization').replace('Bearer ', '')
	if(token){
		const account =await currentAccount(token);	
		await model.accountRoles.findAndCountAll({
			where:{AccountId:account['data']['account'].id,RoleId:roleId}
		}).then(async function(rsAccountRole){
			if(rsAccountRole.count>0){
				await model.notifications.update({ // envia notificación de pedido al vendedor
					read:true},
					{where:{id,accountRoleId:rsAccountRole['rows'][0].id}
				}).then(async function(rsNotification){  //envia notificaicón via Email de sus pedido
					//eturn true;
					res.json({"data":{"result":true,"message":"Notificación leida satisfactoriamente"}})
				}).catch(async function(error){
					console.log(error);
					res.json({"data":{"result":false,"message":"Algo salió mal actualizando notificación"}})
				});
			}else{
				//return false;
				res.json({"data":{"result":false,"message":"No poseé notificaciones"}})
			}
			
		}).catch (async function(error){
			console.log(error);
			res.json({"data":{"result":false,"message":"Algo salió mal validando grupo"}})
		})
	}else{
		res.status(403).json({"data":{"result":false,"message":"Token invalido"}})
	}
}
async function getNotificationByAccountRole(data,res){ //Notificación para un usuario 
	const{roleId}=data.params;
	token=data.header('Authorization').replace('Bearer ', '')
	  if(token){
		const account =await currentAccount(token);
		await model.accountRoles.findOne({
		attributes:['id'],
		where:{AccountId:account['data']['account'].id,RoleId:roleId}
		}).then(async function(rsAccountRole){
			await model.notifications.findAndCountAll({ // envia notificación de pedido al vendedor
				attributes:['id','from','body','read'],
				where:{accountRoleId:rsAccountRole.id}			
			}).then(async function(rsNotification){  //envia notification via Email de sus pedido
				res.json(rsNotification);
			}).catch(async function(error){
				console.log(error);
				res.json({"data":{"result":false,"message":"Algo salió mal retornando notificaiones"}});
			});
		}).catch(async function(error){
			console.log(error);
			res.json({"data":{"result":false,"message":"Algo salió mal validando cuenta de usuario"}});
		});
	}else{
		res.status(403).json({"data":{"result":false,"message":"Sesión invalida"}});	
	}
}
async function getNotificationByAccountRoleOne(data,res){ //Notificación para un usuario 
	const{roleId,id}=data.params;
	token=data.header('Authorization').replace('Bearer ', '');
	if(token){
		const account =await currentAccount(token);
		await model.accountRoles.findOne({
			attributes:['id'],
			where:{AccountId:account['data']['account'].id,RoleId:roleId}
			}).then(async function(rsAccountRole){
				await model.notifications.findAndCountAll({ // envia notificación de pedido al vendedor
					attributes:['id','from','body','read'],
					where:{accountRoleId:rsAccountRole.id,id}
				}).then(async function(rsNotification){  
					res.json(rsNotification);
				}).catch(async function(error){
					console.log(error);
					res.json({"data":{"result":false,"message":"Algo salió mal retornando notificaiones"}});
				});
			}).catch(async function(error){
				console.log(error);
				res.json({"data":{"result":false,"message":"Algo salió mal validando cuenta de usuario"}});
			});
	}
}
function  sortJSON ( data,key,orden)  {
    return  data.sort ( function  ( a ,  b )  {
        var x = a[key],
        y = b[key];
        if(orden  === 'asc'){
            return  ( ( x  <  y ) ? - 1 : ( ( x  >  y ) ? 1 : 0 ) ) ;
        }
        if(orden  === 'desc'){
            return  ( ( x  >  y ) ? - 1 : ( ( x  <  y ) ? 1 : 0 ) ) ;
        }
    } ) ;
}
async function getTaxByType(req,res){
	const {taxTypeId}=req.params;
	await model.tax.findAll({
		attributes:['id','name'],		
		include:[
			{
				model:model.taxType,
				attributes:['id','name'],
				where:{id:taxTypeId}		
			}
		]
	}).then(async function(rsTax){
		res.json(rsTax);
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retornando impuestos"}})
	})
}
async function getTaxType(req,res){	
	await model.taxType.findAll({
		attributes:['id','name']
	}).then(async function(rsTax){
		res.json(rsTax);
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retornando tipos de impuestos"}})
	})
}
module.exports={
	getDocType,getPhoneType,getStoreType,getChannels,getAffirmations,currentAccount,getShopId,
	getNationality,getGender,getDocTypeByPeopleType,getPeopleType,getRegion,getProvince,getComuna,
	getAddrTypes,thisRole,shopByAccount,bank,isShopUpdated,getTypeBankAccount,processType,getSize,
	serviceType,inventoryStock,currentPriceProduct,getDays,setInvnetory,lotExistence,accountCurrent,
	getTaxOne,getTax,getStatus,skuType,skuInInventory,ShopStatusGeneral,getBrands,getDisponibility,
	skuInInventoryById, getOneBidPreView, getBidTypes, stockMonitorGeneral, getMaterials,getReasons,
	getBidAll,getImgByBid,getStockBySku,bidGetOne,getAttachmenType,getImgById,shoppingcarGetGeneral,
	sendNotificationsToUser,getNotificationByAccountRole,readNotifications,getNotificationByAccountRoleOne,
	sortJSON,getTaxByType,getTaxType,getSalesdBySku,getSalesdByMonthByShop
};