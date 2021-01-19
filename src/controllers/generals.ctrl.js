const model=require ('../db/models/index');
const { Op } = require("sequelize");
require ('dotenv').config();
var jwt=require('jwt-simple');

async function currentAccount(token){
	//console.log(token);	
	var  payload= await jwt.decode(token,process.env.JWT_SECRET);
	if(payload){
		const dataToken={"data":{"account":payload.account,"role":payload.role, "people":payload.people,"shop":payload.shop}}
		return dataToken;  
	}else{
		return null
	}
	
	//console.log(dataToken);
    
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
			return res.json({data:{"result":true,"message":"Resultado de busqueda","count":rsResult.count,"rows":rsResult['rows']}})		
		}).catch(async function(error){
			console.log(error);	
			return res.json({"data":{"result":false,"message":"No se pudo retornar tipo de pesona"}})		
			
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
			var rsAccountRoles=  await model.accountRoles.findAndCountAll({attributes:['id'],where:{AccountId:account['accountId'],RoleId:roleId['roleId'][i].id}})
			if (rsAccountRoles.count>0){
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
		console.log(rsShop);
		if(rsShop.count>0){
			return {"data":{"result":true,"shops":{"id":rsShop['rows'][0].id,"name":rsShop['rows'][0].name,"postulacionId":rsShop['rows'][0]['shopRequest'].id}}}
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
		console.log("Addresses NUm: "+rsShop.address.length);
		console.log("Cuentas: "+rsShop.paymentCong);
		console.log("Store: "+rsShop.storeType['data'].length);
		console.log("Process: "+rsShop.processId);
		console.log("Phone: "+rsShop.phone.length);
		console.log("Empleados: "+rsShop.employees);
		console.log("Des: "+rsShop.shopDescription);
		console.log("Socios: "+rsShop.partner.length);
		console.log("Status: "+rsShop.statusId);
		console.log("IsLocal: "+rsShop.isLocal);
		
		if(rsShop.address.length<1 || rsShop.paymentCong==null || rsShop.storeType['data'].length<1 || 
		   rsShop.processId==null || rsShop.phone.length<1 || rsShop.employees==null || rsShop.shopDescription==null
		   || rsShop.partner.length<1 || rsShop.statusId==2 || rsShop.isLocal==null  ){                       
          updated=false;          
        }else{
          updated=true;
        }   
        return updated
    }).catch( function(error){
		console.log(error);
        res.json({"data":{"result":false,"message":"Algo salió mal buscando estatus de su tienda"}})
        
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
	const{skuId,shopId}=data;

	await model.inventoryTransaction.findAll({
	attributes: ['id','type','quantity','createdAt',[model.sequelize.fn('sum', model.sequelize.col('inventory.quantity')), 'qty']],	
	include:[
		{
			model:model.inventory,
			attributes: {exclude: ['createdAt','updatedAt']},
			required:false,
			where:{skuId}
		}
		
	],
	where:{skuId,shopId},
	group:['inventory.id','inventoryTransactions.id','Warehouse.id','sku.id'],

	}).then(async function(rsInventory){
		//console.log(rsInventory[invnetor]);		
		//rsInventory.push({skuExist})
		res.json(rsInventory);		
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salio mal retornando lotes de productos"}});
	});
	
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
		//console.log(rsLotDetails)
		return parseFloat(rsLotDetails);
	}).catch(async function(error){
		console.log(error);
		return {"data":{"result":false,"message":"Algo salio mal retornando detalles del lote"}};
	})
  }
  async function currentPriceProduct(req,res){ // Retorna precio + Comisión + Impuestos
	const shop=await getShopId(req.header('Authorization').replace('Bearer ', ''));  
	const{skuId}=req.params
	
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
  async function lotExistence(data){
	  const {skuId,shopId}=data;
	  
	//if(variation==null){
		return await  model.inventoryTransaction.findAll(	{
			attributes: ['id', 'quantity','type'],			
			where:{type:'out'},
			include:[{
				model:model.inventory,
				attributes:['id','quantity','updatedAt',],
				required:false,
				where:{skuId,shopId,StatusId:1}
			}],
			group:['inventoryTransaction.id','inventory.id']
		}).then(async function(rsLotExistence){		
			return rsLotExistence;
		}).catch(async function(error){
			//console.log(error);
			return {"data":{"result":false,"message":"Algo salió mal retornando stock de producto"}}
		})
	/*}else{
		await  model.inventoryTransaction.findAll(
			{attributes: ['id', [sequelize.fn('sum', sequelize.col('quantity')), 'outTotal']]},
			{where:{inventoryId},
			group:['quanity'],
			include:[{
				model:model.inventory,
				attributes:['quantity'],
				required:true,
				where:{variation:{
					[Op.contains]:[{size: variation.size}],
					[Op.contains]:[{color: variation.color}]
					}
				}
			}]	
		}).then(async function(rsLotExistence){
			const lotExist=rsLotExistence[inventory].quantity-rsLotExistence.outTotal
			return lotExist;
		})
	} */
  }
  async function accountCurrent(token){
	const dataToken=await currentAccount(token);
	return dataToken['data']['account']
  }

  async function getTax(req,res){
	await model.tax.findAll({attributes:['id','name']})
	.then(async function(rsTax){
		res.json(rsTax);
	}).catch(async function(error){
		console.log(error);		
		res.json({"data":{"result":false,"message":"Algo salió mal retornando impuestis"}})
	})
}
async function getTaxOne(req,res){
	const{taxId}=req.params;
	await model.tax.findOne({attributes:['id','name'],
	where:{id:taxId},
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
		res.json({"data":{"result":false,"message":"Algo salió mal retornando impuestio"}})
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
module.exports={
	getDocType,getPhoneType,getStoreType,getChannels,getAffirmations,currentAccount,getShopId,
	getNationality,getGender,getDocTypeByPeopleType,getPeopleType,getRegion,getProvince,getComuna,
	getAddrTypes,thisRole,shopByAccount,bank,isShopUpdated,getTypeBankAccount,processType,getSize,
	serviceType,inventoryStock,currentPriceProduct,getDays,setInvnetory,lotExistence,accountCurrent,
	getTaxOne,getTax,getStatus,skuType};