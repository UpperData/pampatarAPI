const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
const generals=require('./generals.ctrl')
require ('dotenv').config();
var jwt=require('jwt-simple');


async function getShop(req,res){
    //const token = req.header('Authorization').replace('Bearer ', '')
    //var  payload= await jwt.decode(token,process.env.JWT_SECRET);	
    const dataToken=generals.currentAccount(req.header('Authorization').replace('Bearer ', ''))
    const AccountId=dataToken.account;
    var status;
    return await model.shop.findOne({were:{AccountId}})
    .then(async function(rsShop){
        
        if(!rsShop.processId || !rsShop.address || !rsShop.paymentCong || !rsShop.storeType || !rsShop.startActivityAttachment ){                
            res.json({rsShop}) ;
            //console.log(rsShop.name.replace(/ /g, "").length)
            status="Desactualizada"            
        }else{
            status="Actualizada"            
        }        
    }).catch( function(error){
        res.json({"data":{"result":false,"message":"No se pudo encontrar registro de su tienda"}})
        
    })
}

async function edit(req,res){

    const dataToken=generals.currentAccount(req.header('Authorization').replace('Bearer ', ''))
    const{
    name,    
    logo ,
    processId,
    shopDescription,
    isLocal,
    employees,
    partner,
    peopleId,
    phone,
    address,
    paymentCong,
    storeType,
    startActivity,
    startActivityAttachment}=req.body

    return await model.shop.findOne({where:{AccountId:dataToken.account},include: [ model.shopRequest ] })
    .then(async function(srShop){
        console.log(dataToken.account);
       /* if(processId.length>0 || address || paymentCong.length>0 || storeType.length>0 || startActivityAttachment.replace(/ /g, "").length>10 ){                
            return await model.srShop.update(
                name,    
                logo ,
                processId,
                shopDescription,
                isLocal,
                employees,
                partner,
                peopleId,
                phone,
                address,
                paymentCong,
                storeType,
                startActivity,
                startActivityAttachment
            ).then(async function(rsUpdate){
                if(rsUpdate){
                    res.json({"data":{"result":true,"message":"su configuración a sido actualizada con satisfactoriamente"}})
                }
            }).catch(async function(error){

            })
        }else{
            res.json({"data":{"result":false,"message":"Debe completar todos los datos del formulario"}})
        }*/

    }).catch(async function(error){
       // await t.rollback();
       console.log(error);
		res.json({"data":{"result":false,"message":"Algo salió mal, no se pudo verificar su tienda"}})
				   
    })
}

module.exports={getShop,edit};