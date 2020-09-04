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
        return await model.Warehouse.create({name,phone,address,shopId:shop.id,statusId:1})
        .then(async function(rsWarehouse){
                if(rsWarehouse.id>0){
                        
                        
                        var mailsend=await mail.sendEmail({
                        "from":"Pampatar <upper.venezuela@gmail.com>", // Enviar correo
                        "to":dataToken['data']['account'].email,
                        "subject": '.:Nuevo Almacen en Pampatar:.',                        
                        "html":"Usted a creado un nuevo almacen para su tienda <b>"+shop.name +"</b>"
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
module.exports={add};