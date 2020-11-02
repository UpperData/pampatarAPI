const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
const Validator = require('jsonschema').Validator;
const generals=require('./generals.ctrl')
var schMaster = require('../schemas/master.sch.json') // Esquema general para tablas Master
var schAddress = require('../schemas/address.sch.json') // Esquema de Dirección  
var schPhone = require('../schemas/phone.sch.json') // Esquema de telefono

async function add(req,res){
        const t = await model.sequelize.transaction();
        var v = new Validator();  
        v.addSchema(schMaster, '/schMaster');
        const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
        const dataToken=await generals.currentAccount(req.header('Authorization').replace('Bearer ', ''));
        const {name,phone,address}=req.body
        if(!v.validate(address, schAddress)){                
                res.json({data:{"result":false,"message":"Formato de dirección no valido"}});                 
        }
       // console.log(v)
        if(!v.validate(address, schPhone)){   
                console.log({data:{"result":false,"message":"Formato de telefono no valido"}})             ;
                res.json({data:{"result":false,"message":"Formato de telefono no valido"}});                 
        }
        console.log(v)
        return await model.Warehouse.create({name,phone,address,shopId:shop.id,statusId:1},{transaction:t})
        .then(async function(rsWarehouse){
                if(rsWarehouse.id>0){
                        
                        
                        var mailsend=await mail.sendEmail({
                        "from":"Pampatar <upper.venezuela@gmail.com>", // Enviar correo
                        "to":dataToken['data']['account'].email,
                        "subject": '.:Nuevo Almacen en Pampatar:.',                                                
                        "html": `<!doctype html>
                        <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
                        <hr style="width: 420; height: 1; background-color:#99999A;">
                        <link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
                
                        <div  align="center">
                                <h2 style="font-family:sans-serif; color:#ff4338;" >Nuevo Almacén</h2>
                                <p style="font-family:sans-serif; font-size: 19px;" >Ha creado un nuevo almacén en su tienda  <b>`+shop.name+ `</b></p>                                
                                <br>
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
                        if(mailsend){
                                await t.commit();
                                res.json({data:{"result":true,"message":"Almacen creado Satisfactoriamente"}});                
                        }        
                } 
                
        }).catch(async function(error){
                await t.rollback();
                console.log(error);
                if(error.name=='SequelizeUniqueConstraintError'){
                        res.json({data:{"result":false,"message":"Ya existe un almacen con el mismo nombre"}});                
                }else{
                        res.json({data:{"result":false,"message":"Error intentando crear almacen"}});                
                }                                
        });        
}
async function getOne(req,res){
        const{id}=req.params;
        const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
        return await model.Warehouse.findAndCountAll({attributes:['id','name','address','phone'],where:{id,shopId:shop.id,statusId:1}})
        .then(async function(rsWarehouse){
                if(rsWarehouse.count>0){
                        res.json({"data":{"result":true,"message":"Consulta exitosa","count":rsWarehouse.count,"values":rsWarehouse['rows']}}) 
                }else{
                        res.json({"data":{"result":true,"message":"No posee almacén registrado"}}) 
                }
                
        }).catch(async function(error){
                res.json({"data":{"result":false,"message":"No fue posible retornar alamacen"}})
        })       
}
async function getAllMine(req,res){        
        const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
        return await model.Warehouse.findAndCountAll({attributes:['id','name','address','phone'],where:{shopId:shop.id,statusId:1}})
        .then(async function(rsWarehouse){
                if(rsWarehouse.count>0){
                        res.json({"data":{"result":true,"message":"Consulta exitosa","count":rsWarehouse.count,"values":rsWarehouse['rows']}}) 
                }else{
                        res.json({"data":{"result":true,"message":"No posee almacenes registrados"}}) 
                }
                
        }).catch(async function(error){
                res.json({"data":{"result":false,"message":"No fue posible retornar alamacen"}})
        })       
}
async function editWarehouse(req,res){
        const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
        const {id,name,address,phone}=req.body

        //if(isShopUpdated(req.header('Authorization').replace('Bearer ', ''))){
                const t = await model.sequelize.transaction();
                return await model.Warehouse.findAndCountAll({attributes:['id'],where:{id,shopId:shop.id}},{transaction:t})
                .then(async function(rsFindWarehouse){
                if(rsFindWarehouse.count>0){
                return await model.Warehouse.update({name,address,phone},{where:{id,shopId:shop.id}},{transaction:t})
                .then(async function(rsSkus){
                        await t.commit();
                        res.json({"data":{"result":true,"message":"Su almacén fue modificado exitosamente"}})
                }).catch(async function(error){
                        console.log(error);
                        await t.rollback();
                        if(error.name=='SequelizeUniqueConstraintError'){
                        res.json({"data":{"result":false,"message":"Usted ya posee un almacén registrado con este nombre"}})
                        }else{
                        res.json({"data":{"result":false,"message":"Algo salió mal tratando de modificar su almacén"}})
                        }                
                })
                }else{
                res.json({"data":{"result":false,"message":"Este almacén no está registrado en su tienda"}})  
                }
                
                }).catch(async function(error){
                        console.log(error);
                res.json({"data":{"result":false,"message":"Algo salió mal validado su producto"}})
                })    
       // }else{
       //         res.json({"data":{"result":false,"message":"Debe actualizar su cuenta antes realizar esta operación"}})
       // }        
}
module.exports={add,getOne,getAllMine,editWarehouse};