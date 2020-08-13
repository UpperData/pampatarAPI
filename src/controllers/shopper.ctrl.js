const model=require ('../db/models/index');
var jwt=require('jwt-simple');
require('dotenv').config();
const { Op } = require("sequelize");
const mail= require ('./mail.ctrl');
// HOST_BACK
//HOST_FRONT

async  function shopRequest(req,res){
	const t = await model.sequelize.transaction();
try{	
	today=new Date();
	y=today.getFullYear();
	mm=today.getMonth();
	d=today.getDay()
	h=today.getHours();
	m=today.getMinutes();
	s=today.getSeconds();
		
	var horaActual=y+'-'+mm+'-'+d+':'+h+':'+m+':'+s;
	req.body.status={"id":3,"name":"Pendiente","date":horaActual}	
	const token = req.header('Authorization').replace('Bearer ', '')
	var  payload= await jwt.decode(token,process.env.JWT_SECRET);	
	const AccountId=payload.account;
	const {document,status,firstName,lastName,
	phone,marca,storeType,startActivity,isStore,
	descShop,salesChannels,affirmations,employees}=req.body;
	
	//console.log(req.body);
	// consultar si existe otra solicitud con la misma cuenta
	// Validar que no estén vacios	
	return await model.Account.findAndCountAll({where:{id:AccountId,confirmStatus:true}},{ transaction: t })
	.then(async function (rsAccount) {
		
		if (rsAccount.count>0) {
			return await model.shopRequest.findOrCreate({where: {AccountId} ,transaction: t, defaults: {AccountId,status,document,firstName,lastName,
			phone,marca,storeType,startActivity,isStore,descShop,salesChannels,affirmations,employees}})
			.spread(async function(sRequest, created) {
				if (created) {
					//console.log(rsAccount.email);		         
					mail.sendEmail({"from":"Estudio Pampatar",
					"to":rsAccount['rows'][0].email,
					"subject": '.:Tienda Pampatar - Postulación:.',
					"text":"¡Enhorabuena!, Estas aun paso de formar parte de Pampatar",
					"html":"<h2>¡Enhorabuena!</h2> <br> <h4>Estamos evaluando tu solicitud, en un lapso de 72 horas te estaremos notificando el estado de tu solicitud </h4>"
					},{ transaction: t })					
					await t.commit();
					res.json({"data":{"result":true,"message":"Postulación registrada Satisfactoriamente"}})									
					
		      	}else {
					await t.rollback();
					res.json({"data":{"result":false,"message":"Ya usted posee un postulación en tramite con el número: "+sRequest.id}})
				}        
		   }).catch (async function(err) {
					console.log(err);
					await t.rollback();
				    res.json({"data":{"result":false,"message":"Algo salió mal, no se pudo procesar su postulación"}})
				   
				})
	   }else {res.json({"data":{"result":false,"message":"Cuenta no confirmada"}})}
	   
   }).catch (async function(err) {
	   console.log(err);
		await t.rollback();
	   res.json({"data":{"result":false,"message":"Algo salió mal, no se pudo validar su cuenta"}})
	   
	})
}catch(error){
	await t.rollback();
	res.json({"data":{"result":false,"message":"Algo salió mal,Postulación no procesada"}})
  
}

}

module.exports={shopRequest}
