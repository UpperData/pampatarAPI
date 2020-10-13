const model=require ('../db/models/index');
var jwt=require('jwt-simple');
require('dotenv').config();
const { Op } = require("sequelize");
const mail= require ('./mail.ctrl');
// HOST_BACK
//HOST_FRONT

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
		var  payload= await jwt.decode(token,process.env.JWT_SECRET);	
		const AccountId=payload['account'].id;
		console.log(req.body);
		const {document,status,firstName,lastName,
		phone,marca,storeType,startActivity,isStore,
		descShop,salesChannels,affirmations,employees,
		birthDate,genderId,nationalityId}=req.body;
	
	return await model.Account.findAndCountAll({where:{id:AccountId,confirmStatus:true,statusId:1},
	include:[{model:model.People}], transaction: t })
	.then(async function (rsAccount) {
		
		if (rsAccount.count>0) {
			//rsAccount['people'];	
			console.log(rsAccount['rows'][0].id);
			return await model.People.findOrCreate({where:{id:rsAccount['rows'][0].id},	transaction:t,
				defaults: {document,firstName,lastName,birthDate,genderId,nationalityId,statusId:1}}).
				spread(async function(rsPeople, created) {
				//Actualizar cuenta con peopleId
				//console.log(rsPeople.id);
				//console.log(rsAccount['rows'][0].id)
				if(created){
					await model.Account.update({peopleId:rsPeople.id},{where:{id:rsAccount['rows'][0].id}, transaction: t})
				}							
				return await model.shopRequest.findOrCreate({where: {AccountId} ,transaction: t, 
					defaults: {status,phone,marca,storeType,startActivity,isStore,descShop,
								salesChannels,affirmations,employees}})
					.spread(async function(sRequest, created) {
						if (created) {
							//console.log(rsAccount.email);	
							var link=process.env.HOST_FRONT+"veiwRequest/"; // crea link Para ver Postulación
							var link2=process.env.HOST_FRONT+"veiwRequest/"; // crea link Para ver
							var mailsendShoper= mail.sendEmail({
							"from":'"Pampatar" <upper.venezuela@gmail.com>', 
							"to":rsAccount['rows'][0].email,
							"subject": '.:Tienda Pampatar - Postulación:.',
							"text":"¡Enhorabuena!, Estas aun paso de formar parte de Pampatar",							
							"html": `<!doctype html>
							<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
							<hr style="width: 420; height: 1; background-color:#99999A;">
							<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
						
							<div  align="center">
								<h2 style="font-family:sans-serif; color:#ff4338;" >¡Enhorabuena!</h2>
								<p style="font-family:sans-serif; font-size: 19px;" >Se ha solicitado crear una nueva tienda en Pampatar</p>
							</div>
							<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Revisar formulario"></a>
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
	
							var mailsendAdmin= mail.sendEmail({
							"from":'"Pampatar" <upper.venezuela@gmail.com>', 
							"to":'angel.elcampeon@gmail.com',
							"subject": '.:Nueva Postulación:.',
							"text":"Hay un nuevo postulado",							
							"html": `<!doctype html>
							<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
							<hr style="width: 420; height: 1; background-color:#99999A;">
							<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
						
							<div  align="center">
								<h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva Postulación!</h2>
								<p style="font-family:sans-serif; font-size: 19px;" >` + firstName +` `+ lastName + `Se ha solicitado crear una nueva tienda en Pampatar</p>
							</div>
							<a href="`+link2+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Revisar formulario"></a>
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
							if(mailsendAdmin && mailsendShoper)	{
								await t.commit();
								res.json({"data":{"result":true,"message":"Postulación registrada Satisfactoriamente"}})										
							}else{
								await t.rollback()
								res.json({"data":{"result":false,"message":"Ocurrió error tratando de enviar Correo Electrónico"}})										
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
				res.json({"data":{"result":false,"message":"Ocurrió un error actualizando cuenta de usuario"}})
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


}

async  function validateShop(req,res){
	const {shopName}=req.params
	const t = await model.sequelize.transaction();
	if(shopName.length>3){
		return await model.shop.findAndCountAll({where:{name:{[Op.iLike]: shopName}}}, {transaction: t })
		.then(async function(rsShop){
			if(rsShop.count>0){
				res.json({"data":{"result":false,"message":"Ya existe una tienda con este nombre, por favor elija otro nombre"}})				
			}else{
				res.json({"data":{"result":true,"message":"El nombre de su tienda está disponible"}})
			}
		}).catch(async function(error){
			await t.rollback();
			console.log(error)
			res.json({"data":{"result":false,"message":"No fue posible validar la tienda"}})
		})
	}else{
		res.json({"data":{"result":false,"message":"Debe escribir un nombre más descriptivo para su tienda"}})
	}
}
async  function getShopRequestByStatus(req,res){
	const{status}=req.params
	console.log(status);
	return await model.shopRequest.findAndCountAll({where:{status:status.id}})
	.then(async function(rsShopRequest){
		if(rsShopRequest.count>0){
			res.json({"data":{"result":true,"rows":rsShopRequest['rows']}})
		}else{
			res.json({"data":{"result":false,"message":"No hay ninguna solicitud en este estatus"}})
		}
	})	

}
module.exports={shopRequest,validateShop,getShopRequestByStatus}
