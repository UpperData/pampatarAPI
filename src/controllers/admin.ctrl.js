const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
require ('dotenv').config();
//  HOST_BACK ->> VARAIBLES DE ENTORNO DE LA API
//  HOST_FRONT ->> VARAIBLES DE ENTORNO DEL FRONTEND


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
		}] })	
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
		const status=rsShopRequest.status;
		const firstName=rsShopRequest.firstName;
		const lastName=rsShopRequest.lastName;
		const document=rsShopRequest.document;		

		return await model.Account.findByPk(AccountId) // CONSULTA CUENTA DEL POSTULADO
		.then(async function(rsAccount){
			//console.log( rsAccount);
				return await model.People.findOrCreate({where: {id:rsAccount.peopleId} ,transaction: t, defaults:	{ 
					birthDate, 	 
					genderId,	 
					nationalityId,
					firstName,
					lastName,
					document,
					statusId:1					
				}}).then(async function ([user, created]){	
					//console.log(user)
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
						await model.accountRoles.create({"accountId":rsShopRequest['Account'].id,"roleId":roles,"statusId":1},{ transaction: t })
						.then(async function(srAccountRole){
							if(rsShop && srAccountRole){	
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
						}).catch(async function(error){ //Asignando privilegios de vendedor
							//console.log(error)
							res.json({"data":{"result":false,"message":"Ya posee estos permisos"}})
							await t.rollback();	
						})
					}).catch(async function(error){ //Creación de la tienda						
						if(error.name=='SequelizeUniqueConstraintError'){
							res.json({"data":{"result":false,"message":"Ya existe una tienda con el mismo nombre"}}					
						)}else{
							res.json({"data":{"result":false,"message":"Ocurrio un error mientras se creaba la tienda"}})		
						}					
						await t.rollback();						
					})
				}).catch(async function(error){ //Cración de persona
					//console.log(error)
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