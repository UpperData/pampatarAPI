const bcrypt=require("bcryptjs");
const model=require ('../db/models/index');
const {getRoleByAccount}=require('./accountRoles.ctrl');
const servToken=require('./serviceToken.ctrl');
const mail= require ('./mail.ctrl');
const account =require('./account.ctrl');
var moment=require('moment');
const { Op } = require("sequelize");
require ('dotenv').config();

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
						return  await getRoleByAccount({AccountId:rsUser['rows'][0].id})  
						.then(async function (rsAccRoles){							
							if(rsAccRoles.length>0){
								var tokenRole
								var allRole  = [];
								for (let i=0; i<rsAccRoles.length; i++){
									allRole.push({"id":rsAccRoles[i]['Role'].id,"name":rsAccRoles[i]['Role'].name});
								}
								//datos.objeto=JSON.stringify(tokenRole);	
								dataPeople= {"id":people.id,"name":people.firstName,"last":people.lastName}	
								dataAccount={"id":rsUser['rows'][0].id,"name":rsUser['rows'][0].name,"email":rsUser['rows'][0].email}						
								var token =  await servToken.newToken(dataAccount,allRole,{shops:null},dataPeople,'newAccount',) //generar Token 									
								res.status(200).json({data:{"result":true,"message":"Usted a iniciado sesión " + rsUser['rows'][0].email ,"token":token,tokenRole,"people":dataPeople,"account":dataAccount,"role":allRole}});
								
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
	return await model.Account.findAndCountAll({
	atributes:['id'],
	where: {email:userName } })
	.then(async  function (rsResult){				
		if(rsResult.count>0){					
			res.status(200).json({data:{"result":false,"message":"Corro electrónico indicado pertenece a otro usuario"}})
		}else{					
			res.status(200).json({data:{"result":true,"message":"Nombre de usuario esta disponible"}})								
		}
	}).catch (function (error) {
		res.status(200).json({data:{ "result":false,"message":"Error verificando Correo Electrónico"}});			
	});		
}

async function subscribe(req,res){
	try{
		const t = await model.sequelize.transaction();	
		const {email}=req.body	
		const hashConfirm ={"exp":moment().add(1,"days").unix(),"hash":account.getRandom(195)}; //crea hash
		return await model.Subscribes.create({email,hashConfirm},{transaction:t})
		.then(async function(rsSubscribe){			
			if(rsSubscribe){
				var link= process.env.HOST_FRONT+"unsubscribe/"+hashConfirm.hash 
				var mailsend =mail.sendEmail({
				"from":'"Pampatar" <upper.venezuela@gmail.com>', 
				"to":email,
				"subject": '.:Suscripción Pampatar:.',
				"text":"Entérese de las novedades en productos y servicios Pampatar",				
				"html": `<!doctype html>
				<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
				<hr style="width: 420; height: 1; background-color:#99999A;">
				<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
			
				<div  align="center">
					<h2 style="font-family:sans-serif; color:#ff4338;" >¡Suscripción exitosa!</h2>
					<p style="font-family:sans-serif; font-size: 19px;" >Te has suscrito a las notificaciones de Pampatar de manera exitosa.</p>
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
				});
				if(mailsend){
					await t.commit()
					res.status(200).json({data:{result:true,"message":"Suscripción Satisfactoria"}})
				}else{
					await t.rollback()
					res.status(200).json({data:{result:true,"message":"Ocurrió un error procesando la suscripción, intente nuevamente"}})
				}
			}else{
				res.status(200).json({data:{result:true,"message":"Correo Electrónico suscrito anteriormente"}})
			}
		})	
	}catch(error){
		
		res.status(200).json({data:{result:false,"message":"Correo Electrónico suscrito anteriormente"}})
		
	}
	await t.rollback

}

async function unsubscribe(req,res) {
	
	const {id}=req.params; //RECIBE ID DEL SUSCRIPTOR
	const t = await model.sequelize.transaction();	
	if(id!==null){
		return await model.Subscribes.findAndCountAll({where:{id},transaction:t}) // valida suscriptor
		.then (async  function(rsSubscriptor){			
			if(rsSubscriptor.count>0){			
				const hashConfirm ={"exp":moment().add(1,"days").unix(),"hash":account.getRandom(195)}; //crea hash
				return await model.Subscribes.update({hashConfirm},{where:{id},transaction:t}) //agrega hash al suscurptor									//await model.Subscribes.destroy({where:{id}})
				.then (async function (rsResult){
					if(rsResult){
						await t.commit()
						res.redirect(process.env.HOST_FRONT+"unsubscribe/"+hashConfirm.hash); // redirecciona a URL con hash 
						//res.json({data:{"result":true,"message":hashConfirm.hash}})
					}					
				}).catch (async function(err) {
						//console.log(err);
						await t.rollback()
						res.json({data:{"result":false,"message":"No se pudo dar de baja a suscripción"}})
					})		
			}else {
				await t.rollback()
				res.redirect(process.env.HOST_FRONT+"/products");	
				res.json({data:{"result":false,"message":"Token no valido"}})
			}
		}).catch (async function(err) {
			//console.log(err)
			await t.rollback()
			res.json({data:{"result":false,"message":"Token a Expirado"}})
		})		
	}else {
		await t.rollback()
		res.redirect(process.env.HOST_FRONT+"/products");	
		res.json({data:{"result":false,"message":"Intento de acceso no permitido "}})
	}	
}
async function deleteSubscription(req,res) {
	const t = await model.sequelize.transaction();	
	const {skdfdj}=req.params;	
	if(skdfdj!=null){		// IMPORTANTE: si se cambia la longitud de la variable 	
								// "skdfdj" se debes a cambia el parametro del substr()
		return await model.Subscribes.findAndCountAll({
			where:{
						"hashConfirm": { 
                		"hash": {
							[model.Sequelize.Op.eq]:skdfdj.substr(7)							
						},
						
            		}            	
         		}			
			},{transaction:t})											
		.then (async function (rsSearch){
			if (rsSearch.count>0 && moment().unix()< rsSearch['rows'][0]['hashConfirm'].exp) {			
				return await model.Subscribes.destroy({where:{id:rsSearch['rows'][0].id},transaction:t}).				
				then (async function (rsDelete) {
					if(rsDelete){				
						var mailsend=mail.sendEmail({
						"from":"Estudio Pampatar <upper.venezuela@gmail.com>",
						"to":rsSearch['rows'][0].email,
						"subject": '.:Notificación Pampatar:.',
						"text":"Te hemos dado de baja",
						"html": "<h2>¡Regresa pronto!</h2> <br> <h4>Haz solicitado dar de baja a tu suscripción a Pampatar, el proceso se realizo satisfactoriamente </h4>"
						})
						if(mailsend){
							await t.commit()
							res.json({data:{"result":true,"message":"Suscripción fue dada de baja satisfactoriamente"}})				
						}else{
							await t.rollback()
							res.json({data:{"result":true,"message":"Error darte de baja, intenta nuevamente"}})				
						}						
					}				
				})	
			}else {
				await t.rollback()
				res.json({data:{"result":false,"message":"Token a Expirado"}})	
			}				
		}).catch (async function(err) {
				//console.log(err);
				await t.rollback()
				res.json({data:{"result":false,"message":"No se pudo dar de baja a suscripción"}})
			})	
	}else {
		await t.rollback();
		res.json({data:{"result":false,"message":"Usted esta intentando hace un ingreso forzado"}})	
	}
}

async function getCat1(req,res){

	return await model.cat1.findAll({attributes: ['id', 'name']})
	.then(async function(rsMenu){
		console.log(rsMenu['cat1']);

		res.json({"data":{"result":true,"message":"Menu generado satisfactoriamente","menu":rsMenu}})
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal creando menu de categorias"}})
	})
}
async function getCat2(req,res){
	const {cat1Id}=req.body
	return await model.cat2.findAll({where:{cat1Id}}
		)
	.then(async function(rsMenu){
		console.log(rsMenu['cat2']);

		res.json({"data":{"result":true,"message":"Menu generado satisfactoriamente","menu":rsMenu}})
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Error creando menu de categorias"}})
	})
}
async function getCat3(req,res){
	const {cat2Id}=req.body
	return await model.cat3.findAll({where:{cat2Id}}
		)
	.then(async function(rsMenu){
		console.log(rsMenu['cat3']);

		res.json({"data":{"result":true,"message":"Menu generado satisfactoriamente","menu":rsMenu}})
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Error creando menu de categorias"}})
	})
}
async function getCat4(req,res){
	const {cat3Id}=req.body
	return await model.cat4.findAll({where:{cat3Id}}
		)
	.then(async function(rsMenu){
		console.log(rsMenu['cat4']);

		res.json({"data":{"result":true,"message":"Menu generado satisfactoriamente","menu":rsMenu}})
	}).catch(async function(error){
		console.log(error);
		res.json({"data":{"result":false,"message":"Error creando menu de categorias"}})
	})
}
async function getAllMenu(req,res){
	
	return await model.cat1.findAll({ 
		attributes:['id','name'],
		include:[{
			model:model.cat2,
			attributes:['id','name','icon','url'],
			include:[{
				model:model.cat3,
				attributes:['id','name','icon','url'],
				include:[{
					model:model.cat4,
					attributes:['id','name','icon','url'],
				}]
			}]
		}]}
		)
	.then(async function(rsMenu){
		res.json({"data":{"result":true,"message":"Menu generado satisfactoriamente","menu":rsMenu}})
	}).catch(async function(error){
		await t.rollback()
		console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal creando menu de categorias"}})
	})
}
module.exports={singin,userExist,subscribe,unsubscribe,deleteSubscription,getAllMenu,getCat1,getCat2,getCat3,getCat4};							
