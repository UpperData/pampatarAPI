const bcrypt=require("bcryptjs");
const model=require ('../db/models/index');
const {getRoleByAccount}=require('./accountRoles.ctrl');
const servToken=require('./serviceToken.ctrl');
const mail= require ('./mail.ctrl');
const account =require('./account.ctrl');
var moment=require('moment');
const { Op } = require("sequelize");
//const hostAPI ='http://18.230.123.31:4094';
const hostAPI ="http://localhost:4094/";
const host="192.99.255.22/pampatar/"


async function singin(req,res){	
    try{
		const{name,email,pass}=req.body;
		return await model.Account.findAndCountAll({
			attributes:['id','name','email','peopleId','pass'],
			where: {email:email,statusId:1,confirmStatus:true},
        include: [
            model.People
        ]})
			.then(async function (rsUser){	;
			if(rsUser.count>0){	
				return await  bcrypt.compare(pass,rsUser['rows'][0].pass)
				.then(async  function (rsPass){
					if(rsPass){
						if (rsUser['rows']['0'].peopleId!=null) {		
							people= await model.People.findOne({attributes:['id','firstName','lastName'],where:{id:rsUser['rows']['0'].peopleId}});						
						}else {
							people={'id':null,'firstName':null,'lastName':null}
						}						
						return  await getRoleByAccount({accountId:rsUser['rows'][0].id})  
						.then(async function (rsAccRoles){							
							if(rsAccRoles.length>0){
								var tokenRole=new Array();
								for (let i=0; i<rsAccRoles.length; i++){
									tokenRole.push({"id":rsAccRoles[i]['dataValues']['roleid'],"name":rsAccRoles[i]['dataValues']['rolname']});
								}
								tokenRole=JSON.stringify(tokenRole);								
								var token =  await servToken.newToken(rsUser.id,tokenRole) //generar Token 				  								
								res.status(200).json({data:{"result":true,"message":"Usted a iniciado sesión " + rsUser['rows'][0].email ,"token":token,tokenRole,"people":{"id":people.id,"name":people.firstName,"last":people.lastName},"account":{"id":rsUser['rows'][0].id,"name":rsUser['rows'][0].name,"email":rsUser['rows'][0].email}}});
								//console.log({data:{"result":true,"message":"Usted a iniciado sesión como " +rsUser.email ,"token":token,tokenRole,"people":{"id":people.id,"name":people.firstName,"last":people.lastName},"account":{"id":rsUser['rows'][0].id,"name":rsUser['rows'][0].name,"email":rsUser['rows'][0].email}}});
							}
							else{				
								res.status(200).json({data:{"result":false,"message":"Usuario sin autorización"}});
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
			})
	}
    catch(error){	
		console.log(error)		
		res.status(500).json({data:{"result":false,"message":"something goes wrong","problem":error}});
    }
}


async function userExist(req,res){
	const {userName}=req.params;

	try{		
		return await model.Account.findAndCountAll({
			atributes:['id'],
			where: {email:userName } })
			.then(async  function (rsResult){	
				//console.log(rsResult)				
				if(rsResult.count>0){					
					res.status(200).json({data:{"result":false,"message":"Ya existe"}})
				}else{					
					res.status(200).json({data:{"result":true,"message":"Disponible"}})								
				}
			})
	} catch (error){	
		console.log(error	)	
		res.status(200).json({data:{ "result":false,"message":"Ocurrió un error"}});
  }	
}

async function subscribe(req,res){
	try{
		const {email}=req.body	
		return await model.Subscribes.create({email})
		.then(async function(rsSubscribe){			
			if(rsSubscribe){
				var link= hostAPI+"unsubscribe/"+rsSubscribe.id 
				mail.sendEmail({"from":"Estudio Pampatar",
				"to":email,
				"subject": '.:Suscripción Pampatar:.',
				"text":"Entérese de las novedades en productos y servicios Pampatar",
				"html": "<h2>¡Suscripción Satisfactoria!</h2> <br> <h4>Gracias por su preferencia</h4><br><a href='" + link + "'>Dar de baja a mi suscripción</a>"
				})			
				res.status(200).json({data:{result:true,"message":"Suscripción Satisfactoria"}})
				
			}else{
				res.status(200).json({data:{result:true,"message":"Correo Electrónico suscrito anteriormente"}})
			}
		})	
	}catch(error){
		console.log(error)
		res.status(200).json({data:{result:false,"message":"Correo Electrónico suscrito anteriormente"}})
		
	}

}

async function unsubscribe(req,res) {
	
	const {id}=req.params; //RECIBE ID DEL SUSCRIPTOR
	if(id!==null){
		return await model.Subscribes.findAndCountAll({where:{id}}) // valida suscriptor
		.then (async  function(rsSubscriptor){			
			if(rsSubscriptor.count>0){			
				const hashConfirm ={"exp":moment().add(1,"days").unix(),"hash":account.getRandom(195)}; //crea hash
				return await model.Subscribes.update({hashConfirm},{where:{id}}) //agrega hash al suscurptor									//await model.Subscribes.destroy({where:{id}})
				.then (async function (rsResult){
					if(rsResult){
						res.redirect(host+"unsubscribe/"+hashConfirm.hash); // redirecciona a URL con hash 
						//res.json({data:{"result":true,"message":hashConfirm.hash}})
					}					
				}).catch (function(err) {
						console.log(err);
						res.json({data:{"result":false,"message":"No se pudo dar de baja a suscripción"}})})		
			}else {
				res.redirect(host+"/products");	
				res.json({data:{"result":false,"message":"Token no valido"}})
			}
		}).catch (function(err) {
			console.log(err)
			res.json({data:{"result":false,"message":"Token a Expirado"}})})		
	}else {
		res.redirect(host+"/products");	
		res.json({data:{"result":false,"message":"Intento de acceso no permitido "}})
	}
	
}
async function deleteSubscription(req,res) {
	const {skdfdj}=req.params;	
	if(skdfdj!=null){		// IMPORTANTE: si se cambia la longitud de la variable 	
								// "skdfdj" se debes a cambia el parametro del substr()
		return await model.Subscribes.findAndCountAll({
			where:{
						"hashConfirm": { 
                		"hash": {
                    		[model.Sequelize.Op.eq]:skdfdj.substr(7) // <=
                		}
            		}            	
         		}			
			})											
		.then (async function (rsSearch){
			//console.log("Actual: "+moment().unix() +" Regsitrada: "+rsSearch['rows'][0]['hashConfirm'].exp) 
						
			if (rsSearch.count>0 && moment().unix()< rsSearch['rows'][0]['hashConfirm'].exp) {			
				return await model.Subscribes.destroy({where:{id:rsSearch['rows'][0].id}}).				
				then (async function (rsDelete) {
					if(rsDelete){				
						mail.sendEmail({"from":"Estudio Pampatar",
						"to":rsSearch['rows'][0].email,
						"subject": '.:Notificación Pampatar:.',
						"text":"Te hemos dado de baja",
						"html": "<h2>¡Regresa pronto!</h2> <br> <h4>Haz solicitado dar de baja a tu suscripción a Pampatar, el proceso se realizo satisfactoriamente </h4>"
						})
						res.json({data:{"result":true,"message":"Suscripción fue dada de baja satisfactoriamente"}})				
					}				
				})	
			}else {
				res.json({data:{"result":false,"message":"Token a Expirado"}})	
			}
			
								
		}).catch (function(err) {
				console.log(err);
				res.json({data:{"result":false,"message":"No se pudo dar de baja a suscripción"}})})	
	}else {
		res.json({data:{"result":false,"message":"Intento forzado"}})	
	}

}



module.exports={singin,userExist,subscribe,unsubscribe,deleteSubscription};							
