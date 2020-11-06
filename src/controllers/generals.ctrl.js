const model=require ('../db/models/index');
const { Op } = require("sequelize");
require ('dotenv').config();
var jwt=require('jwt-simple');

async function currentAccount(token){
	//console.log(token);	
    var  payload= await jwt.decode(token,process.env.JWT_SECRET);	    
	const dataToken={"data":{"account":payload.account,"role":payload.role, "people":payload.people}}	
    return dataToken;  
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
			console.log(error);	
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
	try{
	  // Valida que tenga permiso de vendedor
	  const isAutorized= dataToken['data']['role'].find(function(e) {
		if( e.id == 5){
		  return true    
		}else{
		  return false
		  //res.json({data:{"result":false,"message":"Usario sin autorización para publicar productos"}}) 
		}
	  })
	  if(isAutorized){
		
		return await model.Account.findAll({where:{id:dataToken['data']['account'].id, statusId:1,confirmStatus:true},
		  include: [{
			model: model.shopRequest,  
			where: { status:{ 
				  [Op.contains]: [{id: 2}] // POSTULACIÓN APROBADA     
					} } , 
			  include:[{
				model: model.shop,
				where: { statusId:1 }  // TIENDA ACTIVA 
			  }]    
		  }]
		}).then(async function(rsAccount){
		 
		  if(rsAccount){
			
			return  rsAccount[0]['shopRequests'][0]['shop']
		  }else{
			res.json({data:{"result":false,"message":"No existe la tienda"}}) 
		  }
		  
		}).catch(async function(error){
		 // console.log(error)
		  res.json({data:{"result":false,"message":"Error identificando tienda, consulte su estatus con el administrador del sistema"}}) 
		})      
		
	  }
	}
	catch(error){
	  console.log(error)
	  res.json({data:{"result":false, "message":"No fue posible identificar si tienda, consulte su estatus con el administrador del sistema"}})
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
			console.log(account['accountId']);
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
				required: false
			}]
		}]
	}).then(async function(rsShop){
		
		if(rsShop.count>0){
			return {"data":{"result":true,"shops":{"id":rsShop['rows'][0].id,"name":rsShop['rows'][0].name}}}
		}else{
			return {"data":{"result":false,"message":"Usuario no posee tienda aprobada"}}
		}		
	})

}

async function isShopUpdated(req,res){
  
    const dataToken=currentAccount(req.token) 
    const AccountId=dataToken.account;
    var updated;
    return await model.shop.findOne({were:{AccountId}})
    .then(async function(rsShop){
		console.log(rsShop.address.length	);
		console.log(rsShop.paymentCong);
		console.log(rsShop.processId);
		console.log(rsShop.storeType);
		console.log(rsShop.startActivityAttachment);
        if(rsShop.storeType==null || rsShop.startActivityAttachment==null ){                       
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
module.exports={
	getDocType,getPhoneType,getStoreType,getChannels,getAffirmations,currentAccount,getShopId,
	getNationality,getGender,getDocTypeByPeopleType,getPeopleType,getRegion,getProvince,getComuna,
	getAddrTypes,thisRole,shopByAccount,bank,isShopUpdated,getTypeBankAccount,processType};

