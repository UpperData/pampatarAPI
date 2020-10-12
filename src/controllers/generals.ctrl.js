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
			return res.json({"data":{"result":false,"message":"No se pudo retornar Provincias","error":error}})		
			
		})
}
module.exports={
	getDocType,getPhoneType,getStoreType,getChannels,getAffirmations,currentAccount,getShopId,
	getNationality,getGender,getDocTypeByPeopleType,getPeopleType,getRegion,getProvince};