const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
require ('dotenv').config();
//  HOST_BACK ->> VARAIBLES DE ENTORNO DE LA API
//  HOST_FRONT ->> VARAIBLES DE ENTORNO DEL FRONTEND

var today=new Date();
async function preShop(req,res) { //Cambia estus de la tienda
	//console.log(req.body);
const t = await model.sequelize.transaction();  	
	const{  
	shopRequestId,
	newStatus	
	}=req.body	
	newStatus.date=today;	
	console.log(newStatus[0].name) 
	return await model.shopRequest.findAll({ where: {id: shopRequestId} ,  // CONSULTA POSTULACION
		include: [{
        	model: model.Account,
			 where:{statusId:1}			
		}],transaction: t })	
	.then(async function(rsShopRequest) { 
		//console.log(rsShopRequest)
		//console.log(rsShopRequest[0].status + rsShopRequest[0]['Account'].email)
		if(rsShopRequest)	{	
					//ACTAULIZA ESTATUS DE LA POSTULACIÓN	
			rsShopRequest[0].status.push(newStatus); // Actualiza registro JSON para estatus de la Postulación			
			await model.shopRequest.update({status:newStatus},{where:{id: shopRequestId},transaction: t}) // Actualiza la postulación
			.then(async function(rsUpdate){			
				if(rsUpdate){	
					//Envia Email de notificación  
					const link=process.env.HOST_FRONT;						
					if(newStatus[0].id==2){
						var btn=`<a href="`+ link +`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Comenzar"></a>`
					}
					var mailsendShopper=mail.sendEmail({
						"from":'Pampatar <upper.venezuela@gmail.com>', 
						"to":rsShopRequest[0]['Account'].email,
						"subject": '.:TIENDA '+newStatus[0].name +':.',						
						"html":`<!doctype html>
						<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
						<hr style="width: 420; height: 1; background-color:#99999A;">
						<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
					
						<div  align="center">
							<h2 style="font-family:sans-serif; color:#ff4338;">Pampatar</h2>
							<p style="font-family:sans-serif; font-size: 19px;" > Tu solictidtud de tienda en Pampatar ha sido `+ newStatus[0].name +`!</p>						
							<a href="`+ link +`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Ir a Pampatar.cl"></a>
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
				res.json({"data":{"result":true,"message":"Ocurró un error actualizando Estatus, intente nuevamente"}})		

			})
		}else{
			await t.rollback();	
			res.json({"data":{"result":false,"message":"Postulación no es valida"}})
		}	
	}).catch(async function(error){ // Validando Postulacion
		console.log(error)
		res.json({"data":{"result":false,"message":"No fue posible validad la postulación"}})
		await t.rollback();	
	})
}
module.exports={preShop};