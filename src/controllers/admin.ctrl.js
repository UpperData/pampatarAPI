const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
require ('dotenv').config();
//  HOST_BACK ->> VARAIBLES DE ENTORNO DE LA API
//  HOST_FRONT ->> VARAIBLES DE ENTORNO DEL FRONTEND

var today=new Date();
var newStatus={"id":1,"date":today,"name":"Aprobado"}	

async function sellerAdd(req,res) {
	//console.log(req.body);
const t = await model.sequelize.transaction();  
	var peopleId;
	const{  
	requestId,
    birthDate, 	 
	genderId,	 
	nationalityId,
	logo,
	processId	,
	partner,
	address,
	paymentCong,
	startActivityAttachment,
	statusId,
	roles
	}=req.body	
	
	return await model.shopRequest.findOne({ where: {id: requestId} ,  // CONSULTA POSTULACION
		include: [{
        	model: model.Account,
			attributes: ['email', 'id']
		}],transaction: t })	
	.then(async function(rsShopRequest) { 								
		const requestId=rsShopRequest.id;
		const isLocal=rsShopRequest.isStore;	
	    const name=rsShopRequest.marca;
	    const employees=rsShopRequest.employees;
	    const AccountId=rsShopRequest.AccountId;
	    const startActivity=rsShopRequest.startActivity;
	    const phone=rsShopRequest.phone;
	    const storeType=rsShopRequest.storeType;
	    const shopDescription=rsShopRequest.descShop;
	    const salesChannels=rsShopRequest.salesChannels;
	    const affirmations=rsShopRequest.affirmations;
		var status=rsShopRequest.status;
		const firstName=rsShopRequest.firstName;
		const lastName=rsShopRequest.lastName;
		const document=rsShopRequest.document;		
				//ACTAULIZA ESTATUS DE LA POSTULACIÓN		
		status.push(newStatus); // Actualiza registro JSON para estatus de la Postulación
		await model.shopRequest.update({status},{where:{id: requestId},transaction: t});

		return await model.Account.findByPk(AccountId) // CONSULTA CUENTA DEL POSTULADO
		.then(async function(rsAccount){
										//BUSCA O CREA REGISTRO DE PERSONA
				return await model.People.findOrCreate({where: {id:rsAccount.peopleId} ,transaction: t, defaults:	{ 
					birthDate, 	 
					genderId,	 
					nationalityId,
					firstName,
					lastName,
					document,
					statusId:1					
				}}).then(async function ([user, created]){	

					await model.Account.update({peopleId:user.id},{where:{id:AccountId}, transaction: t});					
					return await model.shop.create(	 // CREA TIENDA CON DATOS DE LA POSTULACION y otros como null
						{
						   requestId,
						   name,  
						   startActivity, 
						   storeType, 
						   shopDescription, 
						   isLocal,
						   employees,
						   peopleId,
						   phone,						 
						   logo,
						   processId,
						   partner,
						   peopleId:user.id,	
						   address,
						   paymentCong,
						   startActivityAttachment,
						   statusId
					   },{ transaction: t })
					.then(async function(rsShop){
						//BUSCA SI TIENE EL PREMISO ASIGANDO
						try{
							var Rrole = await model.accountRoles.findAndCountAll({where:{"AccountId":rsShopRequest['Account'].id,"RoleId":roles}, transaction: t })
							console.log(Rrole.count)
							if(Rrole.count<1){
								//ASIGNA ROLE A LA CUENTA
								await model.accountRoles.create({"AccountId":rsShopRequest['Account'].id,"RoleId":roles,"StatusId":1},{ transaction: t })	
							}
						}catch(error){res.json({"data":{"result":false,"message":"Ocurrio un error aginanado permiso de vendedor"}})	}

						if(rsShop){	
							//Envia Email de notificación
							const link=process.env.HOST_FRONT+"seller/login";						
							mail.sendEmail({"from":"Estudio Pampatar",
							"to":rsShopRequest['Account'].email,
							"subject": '.:Tienda Pampatar - APROBACIÓN:.',
							"text":"¡Enhorabuena!, Hemos aprobado tu tienda en Pampatar",
							"html": "<h2>¡Enhorabuena!</h2> <br> <h4>Ya eres parte de nuestro equipo, Haga Cick en el enlace para configurar tu tienda para que puedas publicar tus productos.</h4><br><a href="+link+">Click aquí para verificar</a>"
							},{ transaction: t }) 						
							await t.commit(); 
							res.json({"data":{"result":true,"message":"Tienda creada Satisfactoriamente"}})		
						}	
					
					}).catch(async function(error){ //Creación de la tienda						
						if(error.name=='SequelizeUniqueConstraintError'){
							res.json({"data":{"result":false,"message":"Ya existe una tienda con el mismo nombre"}}					
						)}else{
							res.json({"data":{"result":false,"message":"Ocurrio un error mientras se creaba la tienda"}})		
						}	
						console.log(error)				
						await t.rollback();						
					})
				}).catch(async function(error){ //Cración de persona
					console.log(error)
					res.json({"data":{"result":false,"message":"Error actualizando datos personales"}})
					await t.rollback();					
				})
			}).catch(async function(error){ // valiando cuenta
				//console.log(error)
				res.json({"data":{"result":false,"message":"No fue posible validad cuenta asociada a la postulación"}})
				await t.rollback();	
			})
	}).catch(async function(error){ // Validando Postulacion
		//console.log(error)
		res.json({"data":{"result":false,"message":"No fue posible validad la postulación"}})
		await t.rollback();	
	})

/*	
*/

}
module.exports={sellerAdd};