const bcrypt=require("bcryptjs");
const model=require ('../db/models/index');
const {getRoleByAccount}=require('./accountRoles.ctrl');
const servToken=require('./serviceToken.ctrl');
const mail= require ('./mail.ctrl');
const account =require('./account.ctrl');
const hostAPI ='http://18.230.123.31:4094';


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
								console.log({data:{"result":true,"message":"Usted a iniciado sesión como " +rsUser.email ,"token":token,tokenRole,"people":{"id":people.id,"name":people.firstName,"last":people.lastName},"account":{"id":rsUser['rows'][0].id,"name":rsUser['rows'][0].name,"email":rsUser['rows'][0].email}}});
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
				console.log(rsResult)				
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
				mail.sendEmail({"from":"Estudio Pampatar",
				"to":email,
				"subject": '.:Suscripción Pampatar:.',
				"text":"Entérese de las novedades en productos y servicios Pampatar",
				"html": "<h2>¡Suscripción Satisfactoria!</h2> <br> <h4>Gracias por su preferencia</h4><br><br><a href='http://192.82.1.10/unsuscribe'> Dar de baja a mi suscripción</a>"
				})			
				res.status(200).json({data:{result:true,"message":"Suscripción Satisfactoria"}})
				
			}else{
				res.status(200).json({data:{result:true,"message":"Correo Electrónico suscrito anteriormente"}})
			}
		})	
	}catch(error){
		res.status(200).json({data:{result:false,"message":"Correo Electrónico suscrito anteriormente"}})
		
	}

}

module.exports={singin,userExist,subscribe};							
