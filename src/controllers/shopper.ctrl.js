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
		req.body.status=[{"id":3,"name":"Pendiente","date":horaActual}]	
		const token = req.header('Authorization').replace('Bearer ', '')
		var  payload= await jwt.decode(token,process.env.JWT_SECRET);	
		const AccountId=payload['account'].id;
		const {document,status,firstName,lastName,
		phone,marca,storeType,startActivity,isStore,
		descShop,salesChannels,affirmations,employees,
		birthDate,genderId,nationalityId}=req.body;
	
	return await model.Account.findAndCountAll({where:{id:AccountId,confirmStatus:true,statusId:1},
	include:[{model:model.People}], transaction: t })
	.then(async function (rsAccount) {
		console.log()
		if (rsAccount.count>0) {
			//rsAccount['people'];			
			return await model.People.findOrCreate({where:{id:rsAccount['rows'][0]['Person'].id},transaction:t,
				defaults: document,firstName,lastName,birthDate,genderId,nationalityId,statusId:1}).
				spread(async function(rsPeople, created) {
				//Actualizar cuenta con peopleId
				//console.log(rsPeople.id);
				//console.log(rsAccount['rows'][0].id)
				
				return await model.Account.update({peopleId:rsPeople.id},{where:{id:rsAccount['rows'][0].id}, transaction: t})
				.then(async function(rsUpdate){					
					return await model.shopRequest.findOrCreate({where: {AccountId} ,transaction: t, 
						defaults: {status,phone,marca,storeType,startActivity,isStore,descShop,
									salesChannels,affirmations,employees}})
						.spread(async function(sRequest, created) {
							if (created) {
								//console.log(rsAccount.email);		         
								var mailsendShoper= mail.sendEmail({"from":"Estudio Pampatar",
								"to":rsAccount['rows'][0].email,
								"subject": '.:Tienda Pampatar - Postulación:.',
								"text":"¡Enhorabuena!, Estas aun paso de formar parte de Pampatar",
								"html":"<h2>¡Enhorabuena!</h2> <br> <h4>Estamos evaluando tu solicitud, en un lapso de 72 horas te estaremos notificando el estado de tu solicitud </h4>"
								},{ transaction: t })	
		
								var mailsendAdmin= mail.sendEmail({"from":"POSTULACIÓN",
								"to":'angel.elcampeon@gmail.com',
								"subject": '.:Nueva Postulación:.',
								"text":"Hay un nuevo postulado",
								"html":"<h2>¡Enhorabuena!</h2> <br> <h4>"+firstName +" "+ lastName + "se a postulado en Pampatar. <br> <a href='#'>Ver Detalles</a>  </h4>"
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
		await t.rollback()
		console.log(error);
		res.json({"data":{"result":false,"message":"Ocurrió un error actualizando sus datos personales"}})
	})


}

module.exports={shopRequest}
